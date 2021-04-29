//
//  MA.swift
//  Wah Yan SA
//
//  Created by Aaron Cheung 430 on 8/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase

class MA: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = NSURL(string: "https://www.facebook.com/wykmusicassociation/?fref=ts")
        let request = NSURLRequest(url: url! as URL)
        self.webView.loadRequest(request as URLRequest)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

        // Do any additional setup after loading the view.
    }
    @IBAction func Refresh(_ sender: Any) {
        
        FIRAnalytics.logEvent(withName: "MARefresh", parameters: nil)

        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        let url = NSURL(string: "https://www.facebook.com/wykmusicassociation/?fref=ts")
        let request = NSURLRequest(url: url! as URL)
        self.webView.loadRequest(request as URLRequest)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
