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
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 2/255, blue: 45/255, alpha: 1)
    }

    // TODO: Use to ensure a user is logged in.
    private func presentSignInIfUserNotLoggedIn() {
        if NSUserDefaults.standardUserDefaults().objectForKey("username") == nil {
            self.performSegueWithIdentifier(SignInSegue, sender: self)
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
