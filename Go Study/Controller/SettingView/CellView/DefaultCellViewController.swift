//
//  DefaultCellViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class DefaultCellViewController: MainSettingViewController {

    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    var labelText: String?
    var info: String?
    
    var data: DefaultCell?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navItem.title = labelText
        mainLabel.text = labelText
        aboutLabel.text = info
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func exitButton() {
        exitDefault()
        
    }
    
    @IBAction func saveButton() {
        //
        exitDefault()
    }
}
