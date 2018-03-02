//
//  DarkTheme.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

class DarkTheme: ThemeProtocol {
    var Index: Int{
        get {
            return 1
        }
    }
    
    var PrimaryColor: UIColor {
        get {
            return Common.Theme.Dark.Primary
        }
    }
    
    var LightPrimaryColor: UIColor {
        get {
            return Common.Theme.Dark.LightPrimary
        }
    }
    
    var DarkPrimaryColor: UIColor {
        get {
            return Common.Theme.Dark.DrakPrimary
        }
    }
    
    var Text_Icon: UIColor {
        get {
            return Common.Theme.Dark.Text
        }
    }
    
    var AccentColor: UIColor {
        get {
            return Common.Theme.Dark.Accent
        }
    }
    
    var PrimaryText: UIColor {
        get {
            return Common.Theme.Dark.PrimaryText
        }
    }
    
    var SecondText: UIColor {
        get {
            return Common.Theme.Dark.SecondText
        }
    }
    
    var DividerText: UIColor {
        get {
            return Common.Theme.Dark.DividerText
        }
    }    
}
