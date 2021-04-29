//
//  Safari2.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 6/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import SafariServices

class Safari2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Reg(_ sender: Any) {
        FIRAnalytics.logEvent(withName: "WebView2", parameters: nil)
        
    }
    
    @IBAction func PressedHowToGo(_ sender: UIButton) {
        
        FIRAnalytics.logEvent(withName: "Map2", parameters: nil)
        
        let viewController = SFSafariViewController.init(url: URL.init(string:
            "https://maps.apple.com/?address=%E4%B8%AD%E5%9C%8B%E9%A6%99%E6%B8%AF%E7%89%B9%E5%88%AB%E8%A1%8C%E6%94%BF%E5%8D%80%E6%B7%B1%E6%B0%B4%E5%9F%97%E5%8D%80%E9%81%94%E4%B9%8B%E8%B7%AF83%E8%99%9F&auid=1118368560761476&ll=22.336226,114.174458&lsp=57879&q=%E9%A6%99%E6%B8%AF%E5%9F%8E%E5%B8%82%E5%A4%A7%E5%AD%B8%E5%AD%B8%E8%A1%93%E6%A8%93(%E4%B8%80)&t=m")!)
        self.present(viewController, animated: false, completion: nil)
        
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

