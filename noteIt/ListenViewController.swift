//
//  ListenViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class ListenViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var recordToggle: UIButton!
    @IBOutlet weak var recordingStatusLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    var voiceSearch = SKRecognizer()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {

        SpeechKit.setupWithID("NMDPTRIAL_davidseitzjr_gmail_com20151116162553", host: "sandbox.nmdp.nuancemobility.net", port: 443, useSSL: false, certSummary: nil, certData: nil, delegate: nil)

        self.appDelegate.setupSpeechKitConnection()
        self.textField.returnKeyType = UIReturnKeyType.Search

        self.automaticallyStartRecording()
    }

    private func startRecording() {
        self.voiceSearch = SKRecognizer(type: SKSearchRecognizerType,
            detection: UInt(SKShortEndOfSpeechDetection),
            language: "en_US",
            delegate: self)
    }

    private func stopRecording () {
        self.voiceSearch.stopRecording()
        self.voiceSearch.cancel()
    }

    private func automaticallyStartRecording() {
        self.recordToggle.selected = true
        self.startRecording()
    }

    // MARK: - Buttons

    @IBAction func recordToggled(sender: AnyObject) {
        if !self.recordToggle.selected {
            self.startRecording()
            self.recordToggle.selected = true
            self.recordToggle.setTitle("Cancel Recording", forState: UIControlState.Normal)
        } else {
            self.stopRecording()
            self.recordToggle.setTitle("Record", forState: UIControlState.Normal)
            self.recordToggle.selected = false
        }
    }
}

// MARK: - SKRecognizerDelegate

extension ListenViewController: SKRecognizerDelegate {

    func recognizerDidBeginRecording(recognizer: SKRecognizer!) {
        print("Began recording")
        self.recordingStatusLabel.text = "Recording..."
    }

    func recognizerDidFinishRecording(recognizer: SKRecognizer!) {
        print("Finished recording")
        self.recordingStatusLabel.text = "Not recording..."
        self.resultLabel.text = "Loading..."
    }

    func recognizer(recognizer: SKRecognizer!, didFinishWithResults results: SKRecognition!) {
        self.textField.text = results.firstResult()
        self.recordToggle.setTitle("Record", forState: UIControlState.Normal)
        self.recordToggle.selected = false
        self.resultLabel.text = "Result"
    }

    func recognizer(recognizer: SKRecognizer!, didFinishWithError error: NSError!, suggestion: String!) {
        print("There was an error recognizing speech: \(error.localizedDescription)")
    }

}
