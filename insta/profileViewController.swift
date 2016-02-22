//
//  profileViewController.swift
//  insta
//
//  Created by Varun Vyas on 21/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit
import Parse

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Profile view controller ")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutClicked(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            if error == nil {
                print("User logged out")
                self.performSegueWithIdentifier("logOutSegueID", sender: nil)
            }
            else {
                print("Error while logging out")
            }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
