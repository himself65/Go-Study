//
//  NewItemViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/26.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log

class NewItemViewController: SuperViewController {
    @IBOutlet weak var tagSelectButton: UIButton!
    @IBOutlet weak var topBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tagSelectButton.titleLabel?.text = userDefault.string(forKey: Common.Data.defaultTagKey)
        
        tagSelectButton.addTarget(self, action: #selector(self.showTag), for: .touchUpOutside)
    }
    
    override func handelNotification(notification: NSNotification) {
        guard let theme = notification.object as? ThemeProtocol else {
            os_log("通知中无法接收theme", type: .error)
            return
        }
        self.topBar.barTintColor = theme.PrimaryColor
        self.topBar.tintColor = theme.Text_Icon
        self.topBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : theme.Text_Icon]
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveItemClick(_ sender: Any) {
        // TODO
        LocalNotification.addNotification("Fuck", body: "Hello,world")
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK -- When click the tag, show the tag selector
    @objc private func showTag() {
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
