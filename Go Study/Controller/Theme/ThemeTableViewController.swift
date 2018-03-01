//
//  ThemeTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

enum ThemeCell {
    case Default
    case Dark
    
    var themeType: ThemeType {
        get {
            switch self {
            case .Default:
                return ThemeType.defaultTheme
            case .Dark:
                return ThemeType.darkTheme
            }
        }
    }
}

class ThemeTableViewController: SuperTableViewController {
    
    var selectedIndexPath: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        print("\(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
