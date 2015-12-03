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

    @IBOutlet weak var dictateButton: UIButton!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var viewButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Note It"

        let buttons = [
            self.dictateButton,
            self.writeButton,
            self.viewButton,
        ]

        for button in buttons {
            button.roundCornders()
        }

        guard let navBar = self.navigationController?.navigationBar else {
            fatalError("Error retrieving navigation controller.")
        }

        navBar.NITColorize()
    }

    // TODO: Use this function after users have been set up.
    private func presentSignInIfUserNotLoggedIn() {
        if NSUserDefaults.standardUserDefaults().objectForKey("username") == nil {
            self.performSegueWithIdentifier(SignInSegue, sender: self)
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
