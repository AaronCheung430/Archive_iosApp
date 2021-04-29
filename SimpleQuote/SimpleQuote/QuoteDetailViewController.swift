//
//  QuoteDetailViewController.swift
//  SimpleQuote
//
//  Created by Aaron Cheung 430 on 1/9/2018.
//  Copyright © 2018年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import SafariServices

class QuoteDetailViewController: UIViewController {

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var speakerLabel: UILabel!
    @IBOutlet var speakerProfile: UILabel!
    @IBOutlet var speakerImageView: UIImageView!
    
    @IBAction func LearnMore(sender: UIButton) {
        
        if let quote = quote {

            if let url = URL(string: quote.link) {
                let safarViewController = SFSafariViewController(url: url)
                present(safarViewController, animated: true, completion: nil)
            }
        }
    }
    var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let quote = quote {
            
            quoteLabel.text = quote.text
            speakerLabel.text = quote.speaker
            speakerProfile.text = quote.speakerProfile
            speakerImageView.image = UIImage(named: quote.speakerImage)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
