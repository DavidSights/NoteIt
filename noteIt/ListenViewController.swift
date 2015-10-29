//
//  ListenViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class ListenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
