//
//  User+CoreDataProperties.swift
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

extension User {

    @NSManaged var username: String?
    @NSManaged var email: String?
    @NSManaged var password: String?
    @NSManaged var userID: NSNumber?
    @NSManaged var dateCreated: NSDate?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var notes: NSSet?

}
