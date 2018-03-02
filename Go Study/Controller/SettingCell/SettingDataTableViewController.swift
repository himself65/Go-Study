//
//  SettingDataTableViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/24.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

enum DataStyle {
    case Text
    case Picker
    case Tag
}

class CellData: NSObject {
    
    var key: String?
    var titleText: String?
    var moreInfoText :String?
    var dataStyle: DataStyle?
    
    override init() {
        super.init()
    }
    
    init(_ _key: String, title: String, info: String, style: DataStyle) {
        key = _key
        titleText = title
        moreInfoText = info
        dataStyle = style
    }
}

class TextCellData: CellData {
    var textContent: String?
    init(_ _key: String, title: String, info: String, text: String, style: DataStyle) {
        super.init(_key, title: title, info: info, style: style)
        textContent = text
    }
}

class SettingDataTableViewController: SuperTableViewController {
    
    var data = Array<CellData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingDetail" {
            data.append(CellData())
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        
        return cell
    }
}
