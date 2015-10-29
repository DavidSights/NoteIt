//
//  HelpViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
