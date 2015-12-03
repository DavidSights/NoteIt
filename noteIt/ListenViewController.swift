//
//  ListenViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

class ListenViewController: UIViewController {

    @IBOutlet weak var recordToggle: UIButton!
    @IBOutlet weak var recordingStatusLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var closeButton: UIButton!

    private let note = Note.vok_newInstance()
    private let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    private var voiceSearch = SKRecognizer()
    private var recording = true

    override func viewDidLoad() {
        self.textView.text = nil
        self.appDelegate.setupSpeechKitConnection()
        self.automaticallyStartRecording()
        self.recordToggle.roundCornders()
        self.closeButton.roundCornders()
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
        self.recording = true
        self.startRecording()
    }

    // MARK: - Buttons

    @IBAction func recordToggled(sender: AnyObject) {
        if !self.recording {
            self.startRecording()
            self.recording = true
            self.recordToggle.setTitle("Cancel Recording", forState: UIControlState.Normal)
        } else {
            self.stopRecording()
            self.recordToggle.setTitle("Record", forState: UIControlState.Normal)
            self.recording = false
        }
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.note.text = self.textView.text
        VOKCoreDataManager.sharedInstance().saveMainContext()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

// MARK: - SKRecognizerDelegate

extension ListenViewController: SKRecognizerDelegate {

    func recognizerDidBeginRecording(recognizer: SKRecognizer!) {
        print("Began recording")
        self.recordingStatusLabel.text = "Recording"
    }

    func recognizerDidFinishRecording(recognizer: SKRecognizer!) {
        print("Finished recording")
        self.recordingStatusLabel.text = "Loading"
    }

    func recognizer(recognizer: SKRecognizer!, didFinishWithResults results: SKRecognition!) {
        self.textView.text = results.firstResult()
        self.recordToggle.setTitle("Record", forState: UIControlState.Normal)
        self.recordingStatusLabel.text = ""
        self.recording = false
    }

    func recognizer(recognizer: SKRecognizer!, didFinishWithError error: NSError!, suggestion: String!) {
        print("There was an error recognizing speech: \(error.localizedDescription)")
        self.recordingStatusLabel.text = "Recording Canceled"
        self.textView.text = nil
    }

}
