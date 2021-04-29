//
//  Information.swift
//  Wah Yan SA
//
//  Created by Aaron Cheung 430 on 8/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

//import UIKit
//import Firebase
//
//class Information: UIViewController {
//
//    @IBOutlet weak var webView: UIWebView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//
//        
//        let url = NSURL(string: "https://aaroncheungwyk.wixsite.com/itq2017")
//        let request = NSURLRequest(url: url! as URL)
//        self.webView.loadRequest(request as URLRequest)
//        
//        let delayInSeconds = 3.0
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
// 
//
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
