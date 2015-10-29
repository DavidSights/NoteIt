//
//  WriteNoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class WriteNoteViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Write a Note"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.becomeFirstResponder()
    }

    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
