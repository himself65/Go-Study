//
//  CoreDataHandler.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/12.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    private class func getContent() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func fetchObject() -> [StudyData]? {
        let content = getContent()
        var data:[StudyData] = []
        do {
            data = try content.fetch(StudyData.fetchRequest())
            return data
        } catch {
            return nil
        }
    }
}
