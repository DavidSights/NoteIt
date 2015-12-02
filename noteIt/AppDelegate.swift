//
//  AppDelegate.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        CoreDataUtility.setupCoreData()
        return true
    }

    func setupSpeechKitConnection() {
        SpeechKit.setupWithID("NMDPTRIAL_davidseitzjr_gmail_com20151116162553",
            host: "sandbox.nmdp.nuancemobility.net",
            port: 443,
            useSSL: false,
            certSummary: nil,
            certData: nil,
            delegate: nil)

        let earconStart = SKEarcon.earconWithName("earcon_listening.wav") as! SKEarcon
        let earconStop = SKEarcon.earconWithName("earcon_done_listening.wav") as! SKEarcon
        let earconCancel = SKEarcon.earconWithName("earcon_cancel.wav") as! SKEarcon

        SpeechKit.setEarcon(earconStart, forType: UInt(SKStartRecordingEarconType))
        SpeechKit.setEarcon(earconStop, forType: UInt(SKStopRecordingEarconType))
        SpeechKit.setEarcon(earconCancel, forType: UInt(SKCancelRecordingEarconType))
    }
}
