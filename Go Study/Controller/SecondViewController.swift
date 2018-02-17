//
//  SecondViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/1/31.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var refreshControl: UIRefreshControl!
    var defaultSize: CGRect!
    
    var ans: [StudyData] = []
    var data: [StudyData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK - navigationBar hideBottomLine
        navigationBar.shadowImage = UIImage()
        
        data = CoreDataHandler.fetchObject()!
        initTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initTableView() {
        ans = data
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
            ans = data
        } else {
            self.ans = []
            for i in data {
                if (i.title?.lowercased().hasPrefix(searchText.lowercased()))! {
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
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)) as! DataTableViewCell
        cell.label.text = ans[indexPath.row].title
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Unfinished
    }
}
