//
//  WebView3.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 7/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit

class WebView3: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLScSjZ1B4LS_E1b3pqKG7wXT6wOiCRImeCpc0dgpKQEcHsqPZg/viewform")
        let request = NSURLRequest(url: url! as URL)
        self.webView.loadRequest(request as URLRequest)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false


        // Do any additional setup after loading the view.
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
