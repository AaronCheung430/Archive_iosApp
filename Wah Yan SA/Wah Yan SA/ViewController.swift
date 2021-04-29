//
//  ViewController.swift
//  Wah Yan SA
//
//  Created by Aaron Cheung 430 on 8/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func ITQvideo(_ sender: Any) {
        
        FIRAnalytics.logEvent(withName: "PlayLIVE", parameters: nil)
        
        let youtubeId = "www.youtube.com/watch?v=S_-FZYKp4OA"
        var url = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(url as URL)  {
            UIApplication.shared.openURL(url as URL)
        } else {
            url = NSURL(string:"http://\(youtubeId)")!
            UIApplication.shared.openURL(url as URL)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func Info(_ sender: Any) {
//        FIRAnalytics.logEvent(withName: "Vote", parameters: nil)
//
//    }
//
//    @IBAction func Floor(_ sender: Any) {
//        FIRAnalytics.logEvent(withName: "PDF", parameters: nil)
//
//    }

}

