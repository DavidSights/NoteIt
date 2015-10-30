//
//  Note+CoreDataProperties.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/29/15.
//  Copyright © 2015 Vokal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var text: String?
    @NSManaged var dateCreated: NSDate?
    @NSManaged var dateEdited: NSDate?
    @NSManaged var audio: NSData?
    @NSManaged var user: User?

}
