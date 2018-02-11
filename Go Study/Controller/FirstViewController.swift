//
//  FirstViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/1/31.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var finishButton: UIButton!
    
    let userStandard = UserDefaults.standard
    var time: TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func finish(_ sender: Any) {
        if (datePicker.countDownDuration > 60*50) {
            let ac = UIAlertController(title: "输入有误", message: "请重新检查您的输入", preferredStyle: .actionSheet)

            let bt = UIAlertAction(title: "确定", style: .default, handler: nil)
            ac.addAction(bt)
            self.present(ac, animated: true, completion: nil)
        } else {
            time = datePicker.countDownDuration
        }
    }
    
    @IBAction func resetAll(_ sender: Any) {
        let alert = alertShow("你确定要删除所有设置吗？", message: "真的吗？", style: .alert, leftContent: ActionContent(title: "取消", style: .cancel, handler: nil), rightContent: ActionContent(title: "确定", style: .destructive, handler:
        {
            clickHandler in
            let dic = self.userStandard.dictionaryRepresentation()
            for item in dic {
                self.userStandard.removeObject(forKey: item.key)
            }
            self.userStandard.synchronize()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

