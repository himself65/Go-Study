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
    @IBOutlet weak var tabelView: UITableView!
    
    var data = getSettingData()
    
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
        if UserDefaults.standard.bool(forKey: "dark_app") {
            self.view.backgroundColor = UIColor.black
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.section][indexPath.row]
        let cellStyle = item.style
        let cellIdent = converToIdentifier(cellStyle!)

        switch cellStyle
        {
        case .defaultStyle?:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? DefaultTableViewCell
            cell?.leftLabel.text = item.leftLabel
            cell?.accessoryType = .disclosureIndicator
            return cell!
        case .switchStyle?:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? SwitchTableViewCell
            // Switch
            cell?.leftLabel.text = item.leftLabel
            return cell!
        case .textStyle?:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? TextTableViewCell
            cell?.leftLabel.text = item.leftLabel
            cell?.accessoryType = .disclosureIndicator
            return cell!
        case .numberCell?:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent) as? NumberTableViewCell
            cell?.leftLabel.text = item.leftLabel
            cell?.accessoryType = .disclosureIndicator
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: converToIdentifier(.defaultStyle)) as! DefaultTableViewCell?
            cell?.leftLabel.text = item.leftLabel
            return cell!
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        noticeTop("你选择了\(indexPath.section)|\(indexPath.row)")
    }
//    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        noticeTop("你选择了#\(indexPath.row)")
//    }
}
