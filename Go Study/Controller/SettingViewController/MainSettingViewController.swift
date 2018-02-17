//
//  MainSettingViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log

class MainSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func exitAndSave(sender: UIStoryboardSegue) {
        exitDefault()
    }
}
