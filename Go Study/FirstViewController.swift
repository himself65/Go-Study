//
//  FirstViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/1/31.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var countStepper: UIStepper!
    
    let libraryPath = NSHomeDirectory() + "/Library"
    let userStandard = UserDefaults.standard
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = UserDefaults.standard.integer(forKey: "cc")
        countLabel.text = String(count)
        countStepper.value = Double(count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changedValue(_ sender: Any) {
        let button = sender as! UIStepper
        count = Int(button.value)
        countLabel.text = String(count)
        userStandard.set(count, forKey: "cc")
    }
}

