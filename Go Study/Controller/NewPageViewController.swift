//
//  NewPageViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class NewPageViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func exit() {
        print("正在退出新建页面")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fuck(_ sender: Any) {
        exit()
    }
    
    @IBAction func finishButton(_ sender: Any) {
        
        if nameTextField.text != "" {
            exit()
        } else {
            self.noticeError("请检查输入", autoClear: true, autoClearTime: 1)
        }
    }
}
