//
//  CoreDataHandler.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/12.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log
import CoreData

// MARK - Common is a Struct
extension Common {
    struct CoreData {
        static let StudyDataKey = "StudyData"
    }
}

let dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"

class CoreDataHandler: NSObject {
    class func getContent() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    /// Useful Function
    /// - parameter key: Key
    /// - parameter value: value
    ///
    /// Example :
    /// getPredicate("id", value: "5") -> "id: '5'"
    /// 
    func getPredicate(_ key: String, value: String) -> String {
        return ("\(key): '\(value)'")
    }
    
    func getID() -> Int {
        return userDefault.integer(forKey: Common.UserDefault.IdKey)
    }
    
    // TODO - Reduce the number of Coding lines
    class func insertStudyData(_ data: StudyData) -> Bool {
        let content = getContent()
        guard let insertData = NSEntityDescription.insertNewObject(forEntityName: Common.CoreData.StudyDataKey, into: content) as? StudyData else {
            os_log("can't insert 'StudyData'", type: .error)
            return false
        }
        // Data
        insertData.info = data.info
        insertData.title = data.title
        insertData.date = data.date
        //
        do {
            try content.save()
            return true
        } catch {
            fatalError("\(error)")
        }
        return false
    }
    
    // TODO - Reduce the number of Coding lines
    class func fetchStudyData(predicate: String? = nil, sort:[[String : Bool]]? = nil, limit: Int? = nil) -> [StudyData]? {
        let content = getContent()
        let request: NSFetchRequest = StudyData.fetchRequest()
        if predicate != nil {
            request.predicate = NSPredicate(format: predicate!)
        }
        if sort != nil {
            var sortArray: [NSSortDescriptor] = []
            for sortCond in sort! {
                for (k , v) in sortCond {
                    sortArray.append(NSSortDescriptor(key: k, ascending: v))
                }
            }
            request.sortDescriptors = sortArray
        }
        if limit != nil {
            request.fetchLimit = limit!
        }
        var data:[StudyData] = []
        do {
            data = try content.fetch(StudyData.fetchRequest())
            return data
        } catch {
            return nil
        }
    }
    
    // TODO - Reduce the number of Coding lines
    class func deleteStudyData(_ predicate: String? = nil) -> Bool {
        let content = self.getContent()
        if let results = self.fetchStudyData(predicate: predicate) {
            for result in results {
                content.delete(result)
            }
            
            do {
                try content.save()
                
                return true
            } catch {
                fatalError("\(error)")
            }
        }
        return false
    }
    
    // MARK - Only For String, Int, Double, Float, Date, Bool.
    // name -
    class func insert(_ name: String, attitubes: [String: String] ) -> Bool {
        let content = self.getContent()
        let insertData = NSEntityDescription.insertNewObject(forEntityName: name, into: content)
        // info
        for (key, value) in attitubes {
            let type = insertData.entity.attributesByName[key]?.attributeType
            
            
            if type == NSAttributeType.integer16AttributeType ||
                type == NSAttributeType.integer32AttributeType ||
                type == NSAttributeType.integer64AttributeType {
                // Int
                insertData.setValue(Int(value), forKey: key)
            } else if type == NSAttributeType.doubleAttributeType ||
                type == NSAttributeType.floatAttributeType {
                // Double, Float
                insertData.setValue(Double(value), forKey: key)
            } else if type == NSAttributeType.booleanAttributeType {
                // Bool
                insertData.setValue(Bool(value), forKey: key)
            } else if type == NSAttributeType.dateAttributeType {
                // Date
                //
                // MARK - Conver String To Date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = dateFormat
                insertData.setValue(dateFormatter.date(from: value), forKey: key)
            } else if type == NSAttributeType.stringAttributeType {
                // String
                insertData.setValue(String(value), forKey: key)
            }
            // TODO - Support for Other Type
        }
        // END - Insert
        do {
            try content.save()
            return true
        } catch {
            fatalError("\(error)")
        }
        return false
    }
    
    /// TODO - Add Document
    class func fetch(_ name: String, predicate: String? = nil, sort:[[String : Bool]]? = nil, limit: Int? = nil) -> [NSManagedObject]? {
        let content = self.getContent()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        
        if predicate != nil {
            request.predicate = NSPredicate(format: predicate!)
        }
        
        if sort != nil {
            var sortArray: [NSSortDescriptor] = []
            for sortCond in sort! {
                for (k , v) in sortCond {
                    sortArray.append(NSSortDescriptor(key: k, ascending: v))
                }
            }
            request.sortDescriptors = sortArray
        }
        
        if limit != nil {
            request.fetchLimit = limit!
        }
        
        do {
            return try content.fetch(request) as? [NSManagedObject]
            
        } catch {
            fatalError("\(error)")
        }
        
        return nil
    }
}
