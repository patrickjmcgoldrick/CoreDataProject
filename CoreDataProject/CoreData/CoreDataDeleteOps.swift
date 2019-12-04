//
//  CoreDataDeleteOps.swift
//  CoreDataClassDemo
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import CoreData

class CoreDataDeleteOps {
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = CoreDataDeleteOps()
    
    func deleteAllSports() {
        let sports = CoreDataFetchOps.shared.getAllSports()
        print(sports.count)
        
        if sports.count != 0 {
            coreDataManager.batchDelete(objects: sports, context: context)
        }
    }
    
    func deleteBy(name: String) {
        let fetchRequest: NSFetchRequest<Sport> = Sport.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        let sports = coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
        if sports.count != 0 {
            coreDataManager.batchDelete(objects: sports, context: context)
        }
    }
}
