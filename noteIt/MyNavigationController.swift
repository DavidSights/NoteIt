//
//  MyNavigationController.swift
//  noteIt
//
//  Created by David Seitz Jr on 12/3/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.NITColorize()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}