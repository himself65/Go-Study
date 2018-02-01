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
    
    private func notice(title: String) {
        let alertController = UIAlertController (title: title, message: "", preferredStyle: .alert)
        self.present(
            alertController,
            animated: true,
            completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alertController.dismiss(animated: false, completion: nil)
        }
    }
    
    private func exit() {
        print("正在退出")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fuck(_ sender: Any) {
        exit()
    }
    
    @IBAction func finishButton(_ sender: Any) {
        
        if nameTextField.text != "" {
            exit()
        } else {
            notice(title: "请输入")
        }
        
    }
    
}
