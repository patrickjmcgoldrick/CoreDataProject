//
//  CoreDataSaveOps.swift
//  CoreDataProject
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import CoreData

class CoreDataSaveOps {
    let coreDataManager = CoreDataManager.shared
    let context = CoreDataManager.shared.mainContext
    static let shared = CoreDataSaveOps()
    
    private init() {}
    
    func saveSport(sportObject: SportModel) {
        
        let sportManagedObject = Sport(context: context)
        sportManagedObject.name = sportObject.name
        sportManagedObject.desc = sportObject.desc
        sportManagedObject.imageName = sportObject.imageName
        sportManagedObject.imageURL = sportObject.imageURL
        
        coreDataManager.saveContext(context: context)
    }
}
