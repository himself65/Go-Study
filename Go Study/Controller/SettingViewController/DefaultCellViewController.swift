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
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let data = sender as? DefaultCell else {
            fatalError("error segue")
        }
        aboutLabel.text = data.moreInfo
    }
}
