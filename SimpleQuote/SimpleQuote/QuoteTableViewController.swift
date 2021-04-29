//
//  QuoteTableViewController.swift
//  SimpleQuote
//
//  Created by Aaron Cheung 430 on 1/9/2018.
//  Copyright © 2018年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import SafariServices

class QuoteTableViewController: UITableViewController {

    var quotes = [Quote(text: "Brick walls are there for a reason: they let us prove how badly we want things.", link: "https://www.ted.com/talks/randy_pausch_really_achieving_your_childhood_dreams", speaker: "Randy Pausch", speakerProfile: "Carnegie Mellon Professor", speakerImage: "randy-pausch"),
                  Quote(text: "Don't aspire to make a living. Aspire to make a difference.", link: "https://www.youtube.com/watch?v=tlY0PkWxCW8", speaker: "Denzel Washington", speakerProfile: "Actor, Director, and Producer", speakerImage: "denzel-washington"),
                  Quote(text: "It ain't about how hard you hit. It's about how hard you get hit and keep moving forward. That's how winning is done.", link: "https://www.youtube.com/watch?v=vJHkTtvnUqA", speaker: "Rocky", speakerProfile: "Fictional Boxer", speakerImage: "rocky"),
                  Quote(text: "Life is not designed to make things easy for us, but present challenges that help us grow.", link: "https://tim.blog/2017/10/29/terry-laughlin/", speaker: "Terry Laughlin", speakerProfile: "Founder of Total Immersion Swimming and co-author of Total Immersion", speakerImage: "terry-laughlin"),
                  Quote(text: "Stay weird, stay different. And then when it's your turn and you're standing on this stage, please pass the same message to the next person who comes along.", link: "https://www.youtube.com/watch?v=1vZ2BmfIHaA", speaker: "Graham Moore", speakerProfile: "Screenwriter and Author", speakerImage: "graham-moore"),
                  Quote(text: "Don't wait to be ready. You won’t be, until you start.", link: "https://www.goalcast.com/2017/07/17/peter-dinklage-ready-never-comes/", speaker: "Peter Dinklage", speakerProfile: "Action and Film Producer", speakerImage: "peter-dinklage")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let quote = quotes[indexPath.row]
        
            if let url = URL(string: quote.link) {
                let safarViewController = SFSafariViewController(url: url)
                present(safarViewController, animated: true, completion: nil)
            }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! QuoteCustomCell

        // Configure the cell...
        let quote = quotes[indexPath.row]
        cell.quoteLabel.text = quote.text
        cell.speakerImageView.image = UIImage(named: quote.speakerImage)
        
        cell.speakerImageView.layer.cornerRadius = 22.5
        cell.speakerImageView.layer.masksToBounds = true
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "quoteDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let destinationController = segue.destination as!
    QuoteDetailViewController
                destinationController.quote = quotes[indexPath.row]
            }
        }
        
    }
    

}
