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
    
    var param = userDefault.integer(forKey: "lastDuration")
    var maxtime = userDefault.integer(forKey: "lastDuration")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let time = TimeInterval(exactly: (param * 60))
        let timer = Timer.scheduledTimer(timeInterval: time!, target: self, selector: #selector(timeChange), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc func timeChange() {
        param = param - 1
        if param == -1 {
            noticeTop("结束倒计时")
            dismiss(animated: true
                , completion: nil)
        } else {
            let dur = (param / maxtime) * 100
            progerssView.setProgress(dur, aimated: true, withDuration: 0.55)
        }
    }
    
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
}
