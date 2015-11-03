//
//  NoteViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var textView: UITextView?

    var note:Note?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Note text: \(self.note?.text)")
        self.textView?.text = self.note?.text
    }
}
