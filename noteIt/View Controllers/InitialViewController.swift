//
//  ViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

private let SignInSegue = "SignInSegue"

class InitialViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Note It"
    }

    // TODO: Use to ensure a user is logged in.
    private func presentSignInIfUserNotLoggedIn() {
        if NSUserDefaults.standardUserDefaults().objectForKey("username") == nil {
            self.performSegueWithIdentifier(SignInSegue, sender: self)
        }
    }
}
