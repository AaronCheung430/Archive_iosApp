//
//  WebView2.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 6/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit

class WebView2: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeCPXYYmSBAoPHW4JLqxVeTrsZ_ekujbIl0mWY31kfjkUpLjA/viewform")
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
