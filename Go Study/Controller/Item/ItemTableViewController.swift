//
//  ItemTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/23.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class ItemTableViewController: SuperTableViewController {
    
    var data = Array<String>()
    var indexPath: IndexPath?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
    }
    
    private func initNavigationBar() {
        let theme = ThemeManager.shareInstance().theme
        
        // MARK -- SearchController Attitube
        if #available(iOS 11.0, *) {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "搜索"
            for subView in searchController.searchBar.subviews {
                subView.backgroundColor = theme.Text_Icon
            }
            definesPresentationContext = true
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.defaultPrompt)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationItem.searchController = searchController
        }
        
        // MARK -- Large Title Attitube
        //  iOS 11.0
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : theme.Text_Icon]
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        // TODO 还是有阴影，不知道是不是bug
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        data = loadData_Test()
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
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
