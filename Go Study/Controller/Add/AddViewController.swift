//
//  AddViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/24.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

struct PomClock {
    var duration: Int
}

class AddViewController: SuperViewController {
    
    @IBOutlet weak var timePicker: UIPickerView!
    var duration: Int = userDefault.integer(forKey: "defaultDuration")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.selectRow( (duration/5) - 1 , inComponent: 0, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "start"?:
            let vc = segue.destination as! ProcessViewController
            let clock = PomClock( duration: self.duration )
            vc.param = clock
        default:
            break
        }
    }
    
    @IBAction func restart() {
        userDefault.set(25, forKey: "defaultDuration")
    }
}


extension AddViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }
}

// MARK - TODO - Static Content
extension AddViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\( (row + 1) * 5) 分钟"
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        duration = (row + 1) * 5
    }
}
