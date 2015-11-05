//
//  NoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

private let EditString = "Edit"
private let DoneString = "Done"

class NoteViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var editButton: UIBarButtonItem!

    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let
            textView = self.textView,
            note = self.note else {
                return
        }

        textView.text = note.text
    }

    override func viewDidDisappear(animated: Bool) {
        VOKCoreDataManager.sharedInstance().saveMainContext()
    }

    private func updateEditButtonAndTextView() {

        guard let editButton = self.navigationItem.rightBarButtonItem else {
            return
        }

        self.textView.editable = !self.textView.editable

        if editButton.title == EditString {
            editButton.title = DoneString
            self.textView.becomeFirstResponder()
        } else {
            editButton.title = EditString
        }
    }

    @IBAction func editButtonPressed(sender: AnyObject) {
        self.updateEditButtonAndTextView()
    }
}

extension NoteViewController: UITextViewDelegate {

    func textViewDidChange(textView: UITextView) {
        self.note?.text = self.textView.text
    }
}
