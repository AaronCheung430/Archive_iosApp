//
//  AddPost.swift
//  FirebasePost
//
//  Created by Aaron Cheung 430 on 1/2/2017.
//  Copyright © 2017年 Aaron Cheung 430. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddPost: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var Label: UITextField!
    
    @IBOutlet weak var charsLeftLabel: UILabel!
    
    var ref:FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charsLeftLabel.text = "20"

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)

        
        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Label.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPost(_ sender: Any) {
        
        FIRAnalytics.logEvent(withName: "AddPost", parameters: nil)
        
        
//        if Label == nil{
//
//            let alert = UIAlertController(title: "Post Failed", message: "All the fields must be filled out.", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            
//        
//        } else {
//        
        let title = Label.text
        let message = textView.text
        let time = NSDate().timeIntervalSince1970
        
        let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject, "time" : time as AnyObject]
        
        
        // TODO: Post the data o firebase
        ref?.child("Posts").childByAutoId().setValue(post)
        
        
        // Dimiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)

//        }
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = textField.text else { return true }
//        let newLength = text.characters.count + string.characters.count - range.length
//        return newLength <= 20 // Bool
//    }
    
    func checkRemainingChars() {
        
        let allowedChars = 20
        
        let charsInTextView = -Label.text!.characters.count
        
        let remainingChars = allowedChars + charsInTextView
        
        if remainingChars <= allowedChars {
            charsLeftLabel.textColor = UIColor.black
        }
        if remainingChars <= 10 {
            charsLeftLabel.textColor = UIColor.orange
        }
        if remainingChars <= 5 {
            charsLeftLabel.textColor = UIColor.red
        }
        
        charsLeftLabel.text = String(remainingChars)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textView.text = ""
    }
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        checkRemainingChars()
    }

    @IBAction func cancelPost(_ sender: Any) {
        
        FIRAnalytics.logEvent(withName: "CancelPost", parameters: nil)
        // Dimiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
