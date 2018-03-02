//
//  ThemeTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

fileprivate func themeConverToIndexPath() -> IndexPath{
    let row = ThemeManager.manager?.theme.Index
    return IndexPath(row: row ?? 0, section: 0)
}

class ThemeTableViewController: SuperTableViewController {
    
    var selectedIndexPath: IndexPath = themeConverToIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主题选择"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type: ThemeType = ThemeType(rawValue: indexPath.row) ?? ThemeType.defaultTheme
        ThemeManager.switcherTheme(type)
        tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedIndexPath = indexPath
    }
}
