//
//  NITNotesDataSource.swift
//  noteIt
//
//  Created by David Seitz Jr on 11/2/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

class NITNotesDataSource: VOKFetchedResultsDataSource {

    convenience init(tableView: UITableView) {

        self.init(
            predicate: nil,
            cacheName: nil,
            tableView: tableView,
            sectionNameKeyPath: nil,
            sortDescriptors: [],
            managedObjectClass: Note.self)
    }

    override func cellAtIndexPath(indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView?.dequeueReusableCellWithIdentifier("NoteCellID")
        let note:Note = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Note

        cell?.textLabel?.text = note.text

        return cell
    }
}
