//
//  WriteNoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

class WriteNoteViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!

    private let note = Note.vok_newInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Write a Note"
        self.textView.delegate = self;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.becomeFirstResponder()
    }

    @IBAction func closeButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        VOKCoreDataManager.sharedInstance().saveMainContext()
    }
}

extension WriteNoteViewController: UITextViewDelegate {

    func textViewDidChange(textView: UITextView) {
        self.note.text = self.textView.text
    }
}
