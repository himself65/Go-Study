//
//  NewItemViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/26.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import FSCalendar
import os.log
import CoreData

class NewItemViewController: SuperViewController {
    
    @IBOutlet weak var timesText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func handelNotification(notification: NSNotification) {
//        guard let theme = notification.object as? ThemeProtocol else {
//            os_log("通知中无法接收theme", type: .error)
//            return
//        }
//
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveItemClick(_ sender: Any) {
        // TODO
        let data: StudyData = StudyData(context: CoreDataHandler.getContent())
        data.title = titleText.text
        data.date = calendar.selectedDate
        
        if !CoreDataHandler.insertStudyData(data) {
            noticeError("无法保存")
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
