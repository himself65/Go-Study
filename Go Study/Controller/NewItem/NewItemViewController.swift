//
//  NewItemViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/26.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import PGDatePicker
import os.log
import CoreData


class NewItemViewController: SuperViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var dateShowButton: UIButton!
    
    var selectionDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateButton()
    }
    
    private func setDateButton() {
        let dateFormatter = DateFormatter()
        let date = selectionDate
        dateFormatter.dateFormat = dateFormat
        dateShowButton.setTitle(dateFormatter.string(from: date), for: dateShowButton.state)
    }
    
    @objc func frameChanged(_ notification : Notification){
        let info = notification.userInfo
        let kbRect = (info?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let offsetY = kbRect.origin.y - UIScreen.main.bounds.height
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: offsetY)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDate(_ sender: Any) {
        let datePickerManager = PGDatePickManager()
        let datePicker = datePickerManager.datePicker!
        datePicker.datePickerMode = .dateAndTime
        datePicker.delegate = self
        self.present(datePickerManager, animated: false, completion: nil)
    }
    
    @IBAction func saveItemClick(_ sender: Any) {
        // TODO
        let data: StudyData = StudyData(context: CoreDataHandler.getContent())
        data.title = titleText.text
        data.date = selectionDate
        data.id = Int64(userDefault.integer(forKey: Common.UserDefault.IdKey))
        userDefault.set(data.id + 1, forKey: Common.UserDefault.IdKey)
        
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

extension NewItemViewController: PGDatePickerDelegate {
    func datePicker(_ datePicker: PGDatePicker!, didSelectDate dateComponents: DateComponents!) {
        let calendar = Calendar.current
        selectionDate = calendar.date(from: dateComponents)!
        print(selectionDate)
        setDateButton()
    }
}
