//
//  CoreDataUpdateOps.swift
//  CoreDataClassDemo
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import CoreData

class CoreDataUpdateOps {
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = CoreDataUpdateOps()
    
    func updateImageURL(name: String, url: String) {
        
        let sport = CoreDataFetchOps.shared.getSportby(name: name)
            .first
        sport?.imageURL = url
        
        coreDataManager.saveContext(context: context)
    }
}
