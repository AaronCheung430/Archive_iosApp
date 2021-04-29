//
//  Contact Us.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 11/5/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import SafariServices

class Contactus: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func YouTube(_ sender: Any) {
        
        let youtubeId = "TCcycOd083Q"
        var url = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(url as URL)  {
            UIApplication.shared.openURL(url as URL)
        } else {
            url = NSURL(string:"http://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.openURL(url as URL)
        }
        
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
