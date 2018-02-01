//
//  SecondViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/1/31.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var info = [
        "杨泽宇","你爹爹",
        "不知道","轮子哥","不认识"]
    var ans: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = searchBar.value(forKey: "cancelButton") as! UIButton
        button.setTitle("取消", for: .normal)
        ans = info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initTableView() {
        ans = info
        tableView.reloadData()
    }
}

extension SecondViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        initTableView()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText == "" {
            ans = info
        } else {
            self.ans = []
            for i in info {
                if i.lowercased().hasPrefix(searchText.lowercased()) {
                    self.ans.append(i)
                }
            }
        }
        tableView.reloadData()
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ans.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = ans[indexPath.row]
        return cell
    }
    
}
