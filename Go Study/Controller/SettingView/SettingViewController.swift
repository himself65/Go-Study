//
//  SettingViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/6.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import CoreData
import os.log

class SettingViewController: UITableViewController {
    @IBOutlet weak var tabelView: UITableView!
    
    var data = getSettingData()
    var groupsName = getGroupData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension SettingViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.section][indexPath.row]
        let cellStyle = item.style
        let cellIdent = converToIdentifier(cellStyle)
        
        switch cellStyle
        {
        case .defaultStyle:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? DefaultTableViewCell
            cell?.leftLabel.text = item.labelText
            cell?.accessoryType = .disclosureIndicator
            return cell!
        case .switchStyle:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? SwitchTableViewCell
            // Switch
            cell?.leftLabel.text = item.labelText
            return cell!
        case .textStyle:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? TextTableViewCell
            cell?.leftLabel.text = item.labelText
            cell?.accessoryType = .disclosureIndicator
            return cell!
        case .numberStyle:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? NumberTableViewCell
            cell?.leftLabel.text = item.labelText
            cell?.accessoryType = .disclosureIndicator
            return cell!
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupsName[section]
    }
}

extension SettingViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.section][indexPath.row]
        let label = selectedItem.labelText
        let moreInfo = selectedItem.moreInfo
        let style = selectedItem.style
        print("\(label)|\(moreInfo)|\(style)")
        switch style {
        case .defaultStyle:
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "defaultCellController") as! DefaultCellViewController
            newViewController.labelText = label
            newViewController.info = moreInfo
            self.present(newViewController, animated: true, completion: nil)
        case .numberStyle:
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "numberCellController") as! NumberCellViewController
            self.present(newViewController, animated: true, completion: nil)
        case .textStyle:
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "textCellController") as! TextCellViewController
            self.present(newViewController, animated: true, completion: nil)
        case .switchStyle:
            print("Switch Tapped")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
