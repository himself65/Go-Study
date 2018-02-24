//
//  ProcessViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/12.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class ProcessViewController: UIViewController {
    
    @IBOutlet weak var progerssView: ProgressView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 30
        minusButton.layer.cornerRadius = 30
    }
    
    @IBAction func addProgress(_ sender: AnyObject) {
        
        let num = Int(arc4random() % 10)
        
        progerssView.setProgress(progerssView.progress + num, aimated: true, withDuration: 0.50)
    }
    
    @IBAction func minusProgress(_ sender: AnyObject) {
        
        let num = Int(arc4random() % 10)
        
        progerssView.setProgress(progerssView.progress - num, aimated: true, withDuration: 0.50)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func exit(_ sender: Any) {
        exitDefault()
    }
}
