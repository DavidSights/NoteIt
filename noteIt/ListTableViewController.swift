//
//  ListTableViewController.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

private let NoteSegue = "NoteSegue"

class ListTableViewController: UITableViewController {

    private var dataSource: NotesDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Notes"

        self.dataSource = NotesDataSource(tableView: self.tableView)

        self.tableView.NITColorize()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == NoteSegue {

            guard let
                dvc = segue.destinationViewController as? NoteViewController,
                indexPath = self.tableView.indexPathForSelectedRow,
                note = self.dataSource?.fetchedResultsController.objectAtIndexPath(indexPath) as? Note else {
                    return
            }

            dvc.note = note
        }
    }
}
