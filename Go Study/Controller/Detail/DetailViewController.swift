//
//  DetailViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class DetailViewController: SuperViewController {
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    var name: String?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateText.text = dateFormatter.string(from: date ?? Date())
        
        titleText.text = name ?? "没有信息"
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
