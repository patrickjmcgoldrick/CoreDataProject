//
//  CoreDataFetchOps.swift
//  CoreDataClassDemo
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import CoreData

class CoreDataFetchOps {
    
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = CoreDataFetchOps()
    
    private init() {}
    
    func getAllSports() -> [Sport] {
        let fetchRequest: NSFetchRequest<Sport> = Sport.fetchRequest()
        return coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
    }
    
    func getSportby(name: String) -> [Sport] {
        let fetchRequest: NSFetchRequest<Sport> = Sport.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name=%@", name)
        return coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
    }
}
