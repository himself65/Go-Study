//
//  NumberCellViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class NumberCellViewController: MainSettingViewController {

    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var data: NumberCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        exitDefault()
    }
    
    @IBAction func exitButton(_ sender: Any) {
        exitDefault()
    }
}
