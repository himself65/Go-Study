//
//  ItemTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/23.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var data = Array<String>()
    var indexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        
        self.navigationItem.searchController = searchController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
//        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    @objc func longPressGesture(_ tap: UILongPressGestureRecognizer) {
        
        let point = tap.location(in: tableView)
        
        switch tap.state {
        case .began:
            dragBegin(point)
        case .changed:
            dragChanged(point)
        case .ended:
            dragEnded(point)
        case .cancelled:
            dragEnded(point)
        default:
            break
        }
    }
    private func dragBegin(_ point: CGPoint) {
        // 根本不会写
//        indexPath = tableView.indexPathForRow(at: point)
//        if indexPath == nil || (indexPath?.section)! > 0 || indexPath?.item == 0
//        { return }
//
//        let item = tableView.cellForRow(at: indexPath!)
//        item?.isHidden = true
//
    }
    
    private func dragChanged(_ point: CGPoint) {
        // 根本不会写
    }
    
    private func dragEnded(_ point: CGPoint) {
        // 根本不会写
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
