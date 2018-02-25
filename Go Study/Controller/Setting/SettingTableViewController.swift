//
//  SettingTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/24.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var cellIndexPath: IndexPath?
    
    @IBOutlet weak var screenIsOnSwitch: UISwitch!
    @IBOutlet weak var cannotUsePhoneSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        screenIsOnSwitch.isOn = userDefault.bool(forKey: Common.alwaysOnScreenKey)
        cannotUsePhoneSwitch.isOn = userDefault.bool(forKey: Common.cannotUsePhoneKey)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    @IBAction func saveSetting(_ sender: Any) {
        let item = sender as! UISwitch
        let key = item.restorationIdentifier
        if (key != nil) {
            userDefault.set(item.isOn, forKey: key!)
        }
    }
}

extension SettingTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showViewControl(indexPath)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func showViewControl(_ indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: Common.ViewKey.chartViewKey, sender: nil)
            case 1:
                performSegue(withIdentifier: Common.ViewKey.themeViewKey, sender: nil)
            case 2:
                performSegue(withIdentifier: Common.ViewKey.tagViewKey, sender: nil)
            default:
                break
            }
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                break
            case 1:
                break
            case 2:
                break
            default:
                break
            }
        }
    }
}
