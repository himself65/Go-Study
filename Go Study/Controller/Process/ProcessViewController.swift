//
//  ProcessViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/12.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class ProcessViewController: SuperViewController {
    
    @IBOutlet weak var progerssView: ProgressView!
    
    var param: PomClock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(param?.duration ?? -1 )")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
}
