//
//  ThemeManager.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

public let ThemeUpdateNotification = "ThemeUpdateNotification"

// 工厂模式
enum ThemeType {
    case defaultTheme
    case darkTheme
    var theme : ThemeProtocol {
        get {
            switch self {
            case .defaultTheme:
                return DefaultTheme()
            default:
                return DefaultTheme()
            }
        }
    }
}

public final class ThemeManager: NSObject {
    
    var theme: ThemeProtocol = DefaultTheme()
    
    static var manager: ThemeManager? = nil
    static func shareInstance() -> ThemeManager {
        if manager == nil {
            manager = ThemeManager()
        }
        
        return manager!
    }
    
    static func switcherTheme (_ type: ThemeType) {
        ThemeManager.shareInstance().switcherTheme(type)
    }
    
    static func themeUpdate() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: shareInstance().theme)
    }
    
    
    // MARK--- Private Func
    
    private override init() {
        // DO-Nothing
    }
    
    private func switcherTheme (_ type: ThemeType) {
        self.theme = type.theme
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: self.theme)
    }
}
