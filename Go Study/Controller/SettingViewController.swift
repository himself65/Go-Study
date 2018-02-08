//
//  SettingViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/6.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import CoreData

class SettingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedObectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerSettingsBundle()
        NotificationCenter.default.addObserver(self, selector: #selector(SettingViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        defaultsChanged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    @objc func defaultsChanged(){
        if UserDefaults.standard.bool(forKey: "RedThemeKey") {
            self.view.backgroundColor = UIColor.red
        }
        else {
            self.view.backgroundColor = UIColor.green
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAndExit() {
        noticeTop("Success")
        dismiss(animated: true, completion: nil)
    }
}
