//
//  FloorMap.swift
//  Wah Yan SA
//
//  Created by Aaron Cheung 430 on 8/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

//import UIKit
//import Firebase
//import WebKit
//
//class FloorMap: UIViewController, UIScrollViewDelegate {
//    
//    @IBOutlet weak var webview: UIWebView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        if let pdfURL = Bundle.main.url(forResource: "WYK ITQ 2017 AQUIVER Pamphlet", withExtension: "pdf", subdirectory: nil, localization: nil)  {
//            do {
//                let data = try Data(contentsOf: pdfURL)
//                               webview.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
//                view.addSubview(webview)
//                
//            }
//            catch {
//                // catch errors here
//            }
//        
//    }
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
//
//    }
//}
