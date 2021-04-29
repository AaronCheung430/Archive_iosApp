//
//  Sp.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 18/4/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit

class Sponsors: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return self.imageView1
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
