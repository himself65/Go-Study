//
//  DetailViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class DetailViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
