//
//  main.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import Foundation
import UIKit

//Figure out what app delegate to spin up.
let isRunningNonUITests = NSProcessInfo.processInfo().environment["NON_UI_TESTS"]

if isRunningNonUITests != nil {
    UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(TestingAppDelegate))
} else {
    UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(AppDelegate))
}
