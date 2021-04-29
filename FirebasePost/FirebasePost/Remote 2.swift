//
//  Remote 2.swift
//  FirebasePost
//
//  Created by Aaron Cheung 430 on 15/3/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase

class Remote_2: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var height: NSLayoutConstraint!
    
    func updateViewWithRCValues() {
        let TextView = FIRRemoteConfig.remoteConfig().configValue(forKey: "textViewtext").stringValue ?? ""
        textview.text = TextView
        
        let textheight = FIRRemoteConfig.remoteConfig()["textViewHeight"].numberValue?.floatValue ?? 0
        height.constant = CGFloat(textheight)

    }
    
    func setUp(){
        let defaultValues = [
            "textViewtext": "Hi!" as NSObject,
            "textViewHeight": 50 as NSObject,
            
        ]
        FIRRemoteConfig.remoteConfig().setDefaults(defaultValues)
    }
    
    func fetchRemoteConfig(){
        // FIXME: Remove this before we go into production!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        let debugSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
//        FIRRemoteConfig.remoteConfig().configSettings = debugSettings!
        
        FIRRemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { [unowned self](status, error) in
            guard error == nil else{
                print("Uh-oh. Got an error fetching remove values: \(error)")
                return
            }
            print("Hooray! Retrieved values from the cloud!")
            FIRRemoteConfig.remoteConfig().activateFetched()
            self.updateViewWithRCValues()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        fetchRemoteConfig()

        // Do any additional setup after loading the view.
    }

    @IBAction func Refresh(_ sender: Any) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        fetchRemoteConfig()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
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
