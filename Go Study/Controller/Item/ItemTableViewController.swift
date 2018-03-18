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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data = loadData()
    }
    
    override func handelNotification(notification: NSNotification) {
        super.handelNotification(notification: notification)
        guard let theme = notification.object as? ThemeProtocol else {
            os_log("通知中无法接收theme", type: .error)
            return
        }
        // Tableview Theme
        self.itemTableview.separatorColor = theme.LightPrimaryColor
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showData" {
            // TODO
            let navController = segue.destination as! DetailViewController
            let d = data[(indexPath?.row)!]
            navController.title = d.title
            navController.name = d.title
            navController.date = d.date
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK -- Header Setting
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    // MARK -- Can edit
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

//        let mark = UITableViewRowAction(style: .normal, title: " 标记") { action, index in
//            print("mark button tapped")
//        }
//        mark.backgroundColor = .orange
//
//        let share = UITableViewRowAction(style: .normal, title: "分享") { action, index in
//            print("share button tapped")
//        }
//        share.backgroundColor = .blue

        let remove = UITableViewRowAction(style: .default, title: "删除") { action, index in
            let item = self.data[index.row]
            self.data.remove(at: index.row)
            if CoreDataHandler.deleteStudyData("id=\(item.id)") == false {
                self.noticeError("错误")
            } else {
                self.noticeTop("删除成功", autoClear: true, autoClearTime: 1)
                self.tableView.reloadData()
            }
        }
        remove.backgroundColor = .red

        return [remove]
    }
    

}
