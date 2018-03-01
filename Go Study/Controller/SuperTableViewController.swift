//
//  SuperTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class SuperTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeTheme()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func changeTheme() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
        ThemeManager.themeUpdate()
    }
    
    @objc func handleNotification(_ notification: Notification) {
        guard let theme = notification.object as? ThemeProtocol else {
            return
        }
        self.navigationController?.navigationBar.backgroundColor = theme.PrimaryColor
        self.tableView.backgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250)
        // Todo
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
