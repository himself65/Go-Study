//
//  SuperTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log

class SuperTableViewController: UITableViewController, ThemeManagerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeTheme()
    }
    
    func changeTheme() {
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification(notification:)), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
        ThemeManager.themeUpdate()
    }
    
    @objc func handelNotification(notification: NSNotification) {
        guard let theme = notification.object as? ThemeProtocol else {
            os_log("通知中无法接收theme", type: .error)
            return
        }
        self.navigationController?.navigationBar.barTintColor = theme.PrimaryColor
        self.navigationController?.navigationBar.tintColor = theme.Text_Icon
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : theme.Text_Icon]
        
        // MARK - ToolBar Theme
        self.navigationController?.toolbar.tintColor = theme.DarkPrimaryColor
        self.navigationController?.toolbar.backgroundColor = theme.Text_Icon
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
