//
//  Categories.swift
//  noteIt
//
//  Created by David Seitz Jr on 12/3/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCornders() {
        self.layer.cornerRadius = self.frame.height/6
    }
}

extension UINavigationBar {
    func NITColorize() {
        self.barTintColor = UIColor(red: 0/255, green: 2/255, blue: 45/255, alpha: 1)
        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.tintColor = UIColor.whiteColor()
    }
}

extension UITableView {
    func NITColorize() {
        self.backgroundColor = UIColor(red: 53/255, green: 72/255, blue: 131/255, alpha: 1.0)
        self.separatorColor = UIColor(red: 0/255, green: 2/255, blue: 45/255, alpha: 1.0)
    }
}
