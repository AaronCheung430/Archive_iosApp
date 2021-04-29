//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Aaron Cheung 430 on 1/9/2018.
//  Copyright © 2018年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func whoSaidThisButtonTapped(sender: UIButton) {
        
        if let url = URL(string: "https://goo.gl/6czQck") {
            let safarViewController = SFSafariViewController(url: url)
            present(safarViewController, animated: true, completion: nil)
    
        }
    }
}

