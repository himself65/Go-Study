//
//  ItemTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/23.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log

class ItemTableViewController: SuperTableViewController {
    
    @IBOutlet var itemTableview: UITableView!
    
    var data = Array<StudyData>()
    var sortedData = Array<[StudyData]>()
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        data = loadData()
    }
    
//    private func initNavigationBar() {
//        let theme = ThemeManager.shareInstance().theme
//
//    }
    
    override func handelNotification(notification: NSNotification) {
        super.handelNotification(notification: notification)
        guard let theme = notification.object as? ThemeProtocol else {
            os_log("通知中无法接收theme", type: .error)
            return
        }
        // Tableview Theme
        self.itemTableview.separatorColor = theme.LightPrimaryColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK -- Header Setting
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    // MARK -- IS CAN EDIT
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let mark = UITableViewRowAction(style: .normal, title: " 标记") { action, index in
            print("mark button tapped")
        }
        mark.backgroundColor = .orange

        let share = UITableViewRowAction(style: .normal, title: "分享") { action, index in
            print("share button tapped")
        }
        share.backgroundColor = .blue

        let remove = UITableViewRowAction(style: .default, title: "删除") { action, index in print("delete button tapped")
            
        }
        remove.backgroundColor = .red

        return [remove, share, mark]
    }
    

}
