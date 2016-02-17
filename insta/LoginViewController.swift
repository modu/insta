//
//  LoginViewController.swift
//  insta
//
//  Created by Varun Vyas on 16/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup parse keys
        //Parse.setApplicationId("myAppId", clientKey: "myClientKey")
        
        // check if user is logged in.
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        
        // check if user is logged in.
        if PFUser.currentUser() != nil {
            // if there is a logged in user then load the home view controller
            print("User is already Logged in")
            self.performSegueWithIdentifier("homeSegueID", sender: "")
        }
        else {
            print("User is not logged in")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        let username = userNameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    }

    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = userNameField.text
        //newUser.email = passwordField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                
                if error.code == 202 { print("User already Exists")}
            } else {
                print("User Registered successfully")
                self.performSegueWithIdentifier("homeTimeLine", sender: "")
                // manually segue to logged in view
            }
        }
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "homeTimeLine" {
            /*Set some parameter of homeTimeLine if you want to*/
        }
        
    }

}
