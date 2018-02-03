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
    @IBOutlet weak var resetButton: UIButton!;
    //
    let libraryPath = NSHomeDirectory() + "/Library"
    let userStandard = UserDefaults.standard
    let fullScreenSize = UIScreen.main.bounds.size
    // data
    var count = 0
    override func viewDidLoad() {
        if !userStandard.bool(forKey: "launched") {
            firstLaunch()
            userStandard.set(true, forKey: "launched")
        }
        super.viewDidLoad()
        reShow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func firstLaunch() {
        print("首次登陆")
    }
    
    private func reShow() {
        count = UserDefaults.standard.integer(forKey: "cc")
        countLabel.text = String(count)
        countStepper.value = Double(count)
    }
    
    @IBAction func changedValue(_ sender: Any) {
        let button = sender as! UIStepper
        count = Int(button.value)
        countLabel.text = String(count)
        userStandard.set(count, forKey: "cc")
    }
    
    @IBAction func resetAll(_ sender: Any) {
        let alert = alertShow("你确定要删除所有设置吗？", message: "真的吗？", style: .alert, leftContent: ActionContent(title: "取消", style: .cancel, handler: nil), rightContent: ActionContent(title: "确定", style: .destructive, handler: {clickHandler in
            let dic = self.userStandard.dictionaryRepresentation()
            for item in dic {
                self.userStandard.removeObject(forKey: item.key)
            }
            self.userStandard.synchronize()
            self.reShow()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func e() {
        
    }
    
}

