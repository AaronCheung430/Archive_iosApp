//
//  Safari.swift
//  HoC HK
//
//  Created by Aaron Cheung 430 on 31/1/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import SafariServices

class Safari1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Reg(_ sender: Any) {
        FIRAnalytics.logEvent(withName: "WebView1", parameters: nil)

    }
    
    @IBAction func PressedHowToGo(_ sender: UIButton) {
        
        FIRAnalytics.logEvent(withName: "Map1", parameters: nil)
        
        let viewController = SFSafariViewController.init(url: URL.init(string: "https://maps.apple.com/?address=%E9%A6%99%E6%B8%AF%E9%A6%AC%E6%9C%83%E9%81%9319%E8%99%9F&ll=22.508660,114.126557&q=%E9%A6%AC%E6%9C%83%E9%81%9319%E8%99%9F")!)
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
