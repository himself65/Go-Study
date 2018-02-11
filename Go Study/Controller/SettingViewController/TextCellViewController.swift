//
//  TextCellViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class TextCellViewController: MainSettingViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var nameItem: UINavigationItem!
    
    var data: TextCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "text" {
            data = sender as? TextCell
            textFiled.text = data?.textFiled
            nameItem.title = data?.leftLabel
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // save before exit
        // have not finished
        exitDefault()
    }
    
    @IBAction func exitButton(_ sender: Any) {
        exitDefault()
    }
}
