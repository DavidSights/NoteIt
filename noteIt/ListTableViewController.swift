//
//  ListTableViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

private let NoteCellID = "NoteCellID"
private let NoteSegue = "NoteSegue"

class ListTableViewController: UITableViewController {

    private let notes:NSArray = Note.vok_fetchAllForPredicate(nil, forManagedObjectContext: nil)
    private var dataSource: NITNotesDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        dataSource = NITNotesDataSource.init(tableView: self.tableView)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == NoteSegue {
            if let dvc = segue.destinationViewController as? NoteViewController {
                dvc.note = notes.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as? Note
            }
        }
    }
}
