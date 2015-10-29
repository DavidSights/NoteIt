//
//  ViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class InitialViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Note It"
        self.presentSignInIfUserNotLoggedIn()
    }

    // To be used when building for multiple users.
    func presentSignInIfUserNotLoggedIn() {
        if NSUserDefaults.standardUserDefaults().objectForKey("username") == nil {
            self.performSegueWithIdentifier("SignInSegue", sender: self)
        }
    }

}
