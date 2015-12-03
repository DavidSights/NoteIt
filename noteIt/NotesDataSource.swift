//
//  NITNotesDataSource.swift
//  noteIt
//
//  Created by David Seitz Jr on 11/2/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import UIKit
import Vokoder

private let NoteCellID = "NoteCellID"

class NotesDataSource: VOKFetchedResultsDataSource {

    convenience init(tableView: UITableView) {

        self.init(
            predicate: nil,
            cacheName: nil,
            tableView: tableView,
            sectionNameKeyPath: nil,
            sortDescriptors: [],
            managedObjectClass: Note.self)
    }

    override func cellAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {

        guard let
            cell = self.tableView?.dequeueReusableCellWithIdentifier(NoteCellID, forIndexPath: indexPath),
            note = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Note else {
                fatalError("Failed to get cell for identifier \(NoteCellID) or note for index path \(indexPath)")
        }

        cell.textLabel?.text = note.text
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
}
