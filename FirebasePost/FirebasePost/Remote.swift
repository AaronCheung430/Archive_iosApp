//
//  Remote.swift
//  FirebasePost
//
//  Created by Aaron Cheung 430 on 4/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

class Remote: UITabBarController {
    
//    var tabArray = tabBarController?.tabBar.items? as NSArray!
//    var tabItem = tabArray?.object(at: 0) as! UITabBarItem
//    var tabArray = self.tabBarController?.tabBar.items as NSArray!
//    var tabItem = tabArray?.object(at: 1) as! UITabBarItem
    
    func updateViewWithRCValues() {
        
        let textheight = FIRRemoteConfig.remoteConfig()["TarBar"].numberValue?.floatValue ?? 0
//        tabItem.badgeValue = textheight // will use the value of my countObjects Parse query
        
    }
    
    func setUp(){
        let defaultValues = [
            "TarBar": "" as NSObject,
            
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
    
    
}
