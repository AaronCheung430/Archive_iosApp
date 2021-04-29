
//
//  About Us.swift
//  Hour of Code HK
//
//  Created by Aaron Cheung 430 on 18/4/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit

class AboutUs: UITableViewController {
    
    var array: [String] = ["YouTube"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func PressedLocal(_ sender: UITableViewCell) {
//        
//        let youtubeId = "j8C2JHbkiDQ"
//        var url = NSURL(string:"youtube://\(youtubeId)")!
//        if UIApplication.shared.canOpenURL(url as URL)  {
//            UIApplication.shared.openURL(url as URL)
//        } else {
//            url = NSURL(string:"http://www.youtube.com/watch?v=\(youtubeId)")!
//            UIApplication.shared.openURL(url as URL)
//        }
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "YouTube")
//        return cell!
//    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style :UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        cell.tag = indexPath.row
        cell.target(forAction: "getAction:", withSender: self)
        return cell
    }
    
    func getAction(sender:UITableViewCell)->Void {
        if(sender.tag == 0) {
            print("it worked")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouTube")
        
        let youtubeId = "j8C2JHbkiDQ"
        var url = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(url as URL)  {
            UIApplication.shared.openURL(url as URL)
        } else {
            url = NSURL(string:"http://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.openURL(url as URL)
        }
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
