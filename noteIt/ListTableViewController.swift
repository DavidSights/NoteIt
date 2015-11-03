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

class ListTableViewController: UITableViewController {

    private let notes:NSArray = Note.vok_fetchAllForPredicate(nil, forManagedObjectContext: nil)
    private var dataSource: NITNotesDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        dataSource = NITNotesDataSource.init(tableView: self.tableView)
    }
}
