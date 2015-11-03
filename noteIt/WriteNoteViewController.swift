//
//  WriteNoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

class WriteNoteViewController: UIViewController, UITextViewDelegate {

    private let note = Note.vok_newInstance()

    @IBOutlet private weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Write a Note"
        self.textView.delegate = self;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.becomeFirstResponder()
    }

    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func textViewDidChange(textView: UITextView) {
        note.text = self.textView.text
        VOKCoreDataManager.sharedInstance().saveMainContext()
    }
}
