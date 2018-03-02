//
//  NewItemViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/26.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class NewItemViewController: SuperViewController {
    @IBOutlet weak var tagSelectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagSelectButton.titleLabel?.text = userDefault.string(forKey: Common.Data.defaultTagKey)
        
        tagSelectButton.addTarget(self, action: #selector(self.showTag), for: .touchUpOutside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveItemClick(_ sender: Any) {
        // TODO 
    }
    
    @objc private func showTag() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
