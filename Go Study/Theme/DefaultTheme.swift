//
//  DefailtTheme.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

class DefaultTheme: ThemeProtocol {
    var Index: Int {
        get {
            return 0
        }
    }
    var PrimaryColor: UIColor {
        get {
            return Common.Theme.Default.Primary
        }
    }
    
    var LightPrimaryColor: UIColor {
        get {
            return Common.Theme.Default.LightPrimary
        }
    }
    
    var DarkPrimaryColor: UIColor {
        get {
            return Common.Theme.Default.DarkPrimary
        }
    }
    
    var Text_Icon: UIColor {
        get {
            return Common.Theme.Default.Text
        }
    }
    
    var AccentColor: UIColor {
        get {
            return Common.Theme.Default.Accent
        }
    }
    
    var PrimaryText: UIColor {
        get {
            return Common.Theme.Default.PrimaryText
        }
    }
    
    var SecondText: UIColor {
        get {
            return Common.Theme.Default.SecondText
        }
    }
    
    var DividerText: UIColor {
        get {
            return Common.Theme.Default.DividerText
        }
    }    
}
