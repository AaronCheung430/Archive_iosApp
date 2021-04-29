////
////  ViewController.swift
////  FirebasePost
////
////  Created by Aaron Cheung 430 on 1/2/2017.
////  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
////
//
//import UIKit
//import Firebase
//import FirebaseDatabase
//
//struct postStruct {
//    let title : String!
//    let message : String!
////    let time : String!
//}
//
//class TableViewController: UITableViewController {
//    
//    var posts = [postStruct]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let databaseRef = FIRDatabase.database().reference()
//        
//        
//        databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
//        
//            let snapshotValue = snapshot.value as? NSDictionary
//            let title = snapshotValue?["title"] as? String
//            let message = snapshotValue?["message"] as? String
//            let time = snapshotValue?["time"] as? String
//
//            self.posts.insert(postStruct(title: title ,message: message
////                ,time: time
//            ) , at: 0)
//            self.tableView.reloadData()
//        
//        
//        })
//        
//        
//        post()
//        
//    }
//    
//    
//    func post() {
//        
//        let title = "Title"
//        let message = "Message"
////        let time = "Time"
//        
//        let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject
////            , "time" : time as AnyObject
//        ]
//        
//        let databaseRef = FIRDatabase.database().reference()
//        
//        databaseRef.child("Posts").childByAutoId().setValue(post)
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return posts.count
//        
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        
//        let label = cell?.viewWithTag(1) as! UILabel
//        label.text = posts[indexPath.row].title
//        
//        let textview = cell?.viewWithTag(2) as! UITextView
//        textview.text = posts[indexPath.row].message
//        
////        let label2 = cell?.viewWithTag(3) as! UILabel
////        label2.text = posts[indexPath.row].time
//        
//        return cell!
//        
//    }
//    
//}



