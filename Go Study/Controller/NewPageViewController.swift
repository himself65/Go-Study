//
//  NewPageViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import CoreData

class NewPageViewController: UIViewController {

    @IBOutlet weak var titleFiled: UITextField!
    @IBOutlet weak var contentFiled: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func fuck(_ sender: Any) {
        exitDefault()
    }
    
    @IBAction func finishButton(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StudyData", in: context)
        
        let studyData = NSManagedObject(entity: entity!, insertInto: context)
        studyData.setValue(titleFiled.text, forKey: "title")
        studyData.setValue(contentFiled.text, forKey: "moreInfo")
        studyData.setValue(datePicker.date, forKey: "endDate")
        do {
            try context.save()
        } catch {
            print("failed saving")
        }
        noticeTop("创建完成！")
        
        exitDefault()
    }
    
}
