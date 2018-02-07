//
//  CoreDataManager.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/7.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    public lazy var mangerContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        return context
    }()
    
    public lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel:self.mangerModel)
        let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let fileURL = URL(string: "db.sqlite", relativeTo: dirURL)
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: fileURL, options: nil)
        } catch {
            fatalError("Error configuring persistent store: \(error)")
        }
        return coordinator
    }()
    
    public lazy var mangerModel: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: "CoreDataStudy", withExtension: "momd") else{
            fatalError("加载错误")
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else{
            fatalError("加载错误")
        }
        return model
    }()
}
