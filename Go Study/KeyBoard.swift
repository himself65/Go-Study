//
//  KeyBoard.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/3.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
