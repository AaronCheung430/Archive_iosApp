//
//  Safari3.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 7/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import SafariServices

class Safari3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Reg(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        FIRAnalytics.logEvent(withName: "WebView3", parameters: nil)
        
    }
    
    
    @IBAction func PressedHowToGo(_ sender: Any) {
        FIRAnalytics.logEvent(withName: "Map3", parameters: nil)
        
        let viewController = SFSafariViewController.init(url: URL.init(string:
            "https://maps.apple.com/?daddr=(22.481433,%20114.137866)&dirflg=d")!)
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
