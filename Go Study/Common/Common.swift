//
//  Common.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/24.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

let userDefault = UserDefaults.standard

struct Common {
    struct ViewKey {
        static let chartViewKey = "chartView"
        static let themeViewKey = "themeView"
        static let tagViewKey = "tagView"
    }
    static let alwaysOnScreenKey = "alwaysOnScreen"
    static let cannotUsePhoneKey = "cannotUsePhone"
    struct Data {
        static let defaultTagKey = "defaultTag"
    }
    struct Theme {
        struct Dark {
            static let DrakPrimary = UIColor.rgb(red: 69, green: 90, blue: 100)
            
            static let Primary = UIColor.rgb(red: 96, green: 25, blue: 139)
            
            static let Text = UIColor.white
            
            static let Icon = UIColor.white
            
            static let Accent = UIColor.rgb(red: 83, green: 109, blue: 254)
            
            static let LightPrimary = UIColor.rgb(red: 207, green: 216, blue: 220)
            
            static let PrimaryText = Common.Theme.Default.PrimaryText
            static let SecondText = Common.Theme.Default.SecondText
            static let DividerText = Common.Theme.Default.DividerText
        }
        struct Default {
            static let Primary = UIColor(red: 255/255, green: 87/255, blue: 34/255, alpha: 1)
            static let DarkPrimary = UIColor(red: 230/255, green: 74/255, blue: 25/255, alpha: 1)
            
            static let Text = UIColor.white
            
            static let Icon = UIColor.white
            
            static let Accent = UIColor.rgb(red: 68, green: 138, blue: 255)
            
            static let LightPrimary = UIColor(red: 255/255, green: 204/255, blue: 188/255, alpha: 1)
            static let PrimaryText = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
            static let SecondText = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            static let DividerText = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        }
    }
}
