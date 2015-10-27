//
//  TestingAppDelegate.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class TestingAppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let testViewController = UIViewController()
        testViewController.view.backgroundColor = UIColor.redColor()
            .colorWithAlphaComponent(0.5)

        //Add a label to it so it's obvious what you're doing.
        let testLabel = UILabel()
        testLabel.translatesAutoresizingMaskIntoConstraints = false

        //Note: This string doesn't need to be localized since users never see it.
        testLabel.text = "TESTING noteIt WITHOUT UI!"
        testLabel.textColor = .whiteColor()
        testViewController.view.addSubview(testLabel)

        //Pin it to the middle of the view.
        testViewController.view.addConstraint(
            NSLayoutConstraint(item: testLabel,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: testViewController.view,
                attribute: .CenterX,
                multiplier: 1,
                constant: 0))

        testViewController.view.addConstraint(
            NSLayoutConstraint(item: testLabel,
                attribute: .CenterY,
                relatedBy: .Equal,
                toItem: testViewController.view,
                attribute: .CenterY,
                multiplier: 1,
                constant: 0))

        //Fire up the window.
        self.window = UIWindow()
        self.window?.rootViewController = testViewController
        self.window?.makeKeyAndVisible()

        return true
    }
}
