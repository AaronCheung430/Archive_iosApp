//
//  TableView.swift
//  FirebasePost
//
//  Created by Aaron Cheung 430 on 1/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct postStruct {
    let title : String!
    let message : String!
    let dateString : String!
    
}

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var ref: FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    
    var postData = [String]()
    
    var posts = [postStruct]()
    
    var postTime = [Double]()
    
    

    func updateBadgeValue() {
        var tabArray = tabBarController?.tabBar.items as NSArray!
        var tabItem = tabArray?.object(at: 1) as! UITabBarItem
        tabItem.badgeValue = "New!" // will use the value of my countObjects Parse query
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBadgeValue()
        
        FIRDatabase.database().persistenceEnabled = true
        
        // Do any additional setup after loading the view
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 184
        
        // Set the firebase reference
         let ref = FIRDatabase.database().reference()
        
        // Retrieve the posts and listen for changes
        databaseHandle = ref.child("Posts").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
        
            // Code to execute when a child is added under "Posts"
            // Take the value from he snapshot and added it to the postData array
            
            // Try o convert the value of the data to a string
            let snapshotValue = snapshot.value as? NSDictionary
            let title = snapshotValue?["title"] as? String
            let message = snapshotValue?["message"] as? String
            
            let time = snapshotValue?["time"] as? Double
            let date = NSDate.init(timeIntervalSince1970: time!)
            
            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"  dd/MM/yyyy:ss:mm.SSZ

            dateFormatter.dateFormat = "yyyy-MM-dd" + " " + "HH:mm:ss"
            let dateString = dateFormatter.string(from: date as Date)

            
            self.posts.insert(postStruct(title: title ,message: message, dateString: dateString) , at: 0)
//            self.posts.insert(date: date, at: 0)
            
            if let actualPost = title {
            
                // Append he data to our postData array
                self.postData.append(actualPost)
                
                // Reload the tableview
            self.tableView.reloadData()

            }
            if let actualPost = message {
                
                // Append he data to our postData array
                self.postData.append(actualPost)
                
                // Reload the tableview
                self.tableView.reloadData()
                
            }
            
            let scoresRef = FIRDatabase.database().reference(withPath: "Posts")
            scoresRef.keepSynced(true)

        })
    }
//            let data = NSDate.init(timeIntervalSince1970: 1486043531.489398)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Refresh(_ sender: Any) {
        
        // Set the firebase reference
        let ref = FIRDatabase.database().reference()
        
        // Retrieve the posts and listen for changes
        databaseHandle = ref.child("Posts").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            
            // Code to execute when a child is added under "Posts"
            // Take the value from he snapshot and added it to the postData array
            
            // Try o convert the value of the data to a string
            let snapshotValue = snapshot.value as? NSDictionary
            let title = snapshotValue?["title"] as? String
            let message = snapshotValue?["message"] as? String
            
            let time = snapshotValue?["time"] as? Double
            let date = NSDate.init(timeIntervalSince1970: time!)
            
            let dateFormatter = DateFormatter()
            //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"  dd/MM/yyyy:ss:mm.SSZ
            
            dateFormatter.dateFormat = "yyyy-MM-dd" + " " + "HH:mm:ss"
            let dateString = dateFormatter.string(from: date as Date)
            
            
            self.posts.insert(postStruct(title: title ,message: message, dateString: dateString) , at: 0)
            
            if let actualPost = title {
                
                // Append he data to our postData array
                self.postData.append(actualPost)
                
                // Reload the tableview
                self.tableView.reloadData()
                
            }
            if let actualPost = message {
                
                // Append he data to our postData array
                self.postData.append(actualPost)
                
                // Reload the tableview
                self.tableView.reloadData()
                
            }
            
            let scoresRef = FIRDatabase.database().reference(withPath: "Posts")
            scoresRef.keepSynced(true)
        
    
        })
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
//        cell?.textLabel?.text = postData[indexPath.row]
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].title
        
        let textview = cell?.viewWithTag(2) as! UITextView
        textview.text = posts[indexPath.row].message
        
        let label2 = cell?.viewWithTag(3) as! UILabel
        label2.text = posts[indexPath.row].dateString
        
        
        return cell!
        
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
