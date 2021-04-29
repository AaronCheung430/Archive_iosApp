//
//  WebViewCityU1.swift
//  HoC HK
//
//  Created by Aaron Cheung 430 on 31/1/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase

class WebView1: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe_tD75uNfwwYYWfcnP1ijQiiUcsLrVeFuJpw_Wyp_wEijZgg/viewform")
        let request = NSURLRequest(url: url! as URL)
        self.webView.loadRequest(request as URLRequest)

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
