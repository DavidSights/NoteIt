//
//  NoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

class NoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView?
    @IBOutlet weak var editButton: UIBarButtonItem!

    var note:Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView?.text = self.note?.text
        self.textView?.delegate = self
    }

    func updateEditButtonAndTextView() {

        self.textView?.editable = !self.textView!.editable

        if self.navigationItem.rightBarButtonItem?.title == "Edit" {
            self.navigationItem.rightBarButtonItem?.title = "Done"
            self.textView?.becomeFirstResponder()
        } else {
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
    }

    @IBAction func editButtonPressed(sender: AnyObject) {
        self.updateEditButtonAndTextView()
    }

    func textViewDidChange(textView: UITextView) {
        self.note?.text = self.textView?.text
        VOKCoreDataManager.sharedInstance().saveMainContext()
    }
}
