//
//  UINavigationBar-HideLine.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/13.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func hideBottomHairline() {
        self.shadowImage = UIImage()
    }
    
    func showBottomHairline() {
        self.shadowImage = nil
    }
}

extension UIToolbar {
    
    func hideBottomHairline() {
        self.setShadowImage(UIImage(), forToolbarPosition: self.barPosition)
    }
    
    func showHairline() {
        self.setShadowImage(nil, forToolbarPosition: self.barPosition)
    }
}
