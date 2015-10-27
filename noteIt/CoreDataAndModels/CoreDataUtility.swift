//
//  CoreDataUtility.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import Foundation
import Vokoder

struct CoreDataUtility {

    //MARK: - Setup consolidation methods
    
    /**
    Performs initial setup of the core data stack to use an in-memory store 
    for testing.
    */
    static func setupCoreDataForTesting() {
        self.setupCoreDataStackWithDatabaseName(nil)
    }
    
    /**
    Performs initial setup of the core data stack to use a sqlite file with 
    the given file name.
    */
    static func setupCoreData() {
        self.setupCoreDataWithDatabaseName("noteIt.sqlite")
    }
    
    /**
    Wipes the current core data stack out and sets it back up for production use.
    */
    static func nukeAndResetCoreData() {
        self.nukeCoreData()
        self.setupCoreData()
    }
    
    /**
    Wipes the current core data stack out and sets it back up for testing.
    */
    static func nukeAndResetCoreDataForTesting() {
        self.nukeCoreData()
        self.setupCoreDataForTesting()
    }
    
    //MARK: - Private helper methods
    
    private static func nukeCoreData() {
        VOKCoreDataManager.sharedInstance().resetCoreData()
    }
    
    private static func setupCoreDataWithDatabaseName(databaseName: String?) {
        //Setup the actual stack
        self.setupCoreDataStackWithDatabaseName(databaseName)

        //Fire off the object mappers
        self.setupObjectMappers()
    }
    
    private static func setupCoreDataStackWithDatabaseName(databaseName: String?) {
        VOKCoreDataManager.sharedInstance().setResource("noteIt", database: databaseName)
    }
    
    private static func setupObjectMappers() {
        //TODO: Add mapper method firing here
    }
}
