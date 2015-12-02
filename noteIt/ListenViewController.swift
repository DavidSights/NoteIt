//
//  ListenViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class ListenViewController: UIViewController {

    let voiceSearch = SKRecognizer()

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        SpeechKit.setupWithID("NMDPTRIAL_davidseitzjr_gmail_com20151116162553", host: "sandbox.nmdp.nuancemobility.net", port: 443, useSSL: false, certSummary: nil, certData: nil, delegate: nil)
    }
}
