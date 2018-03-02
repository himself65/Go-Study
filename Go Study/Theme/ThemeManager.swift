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
public let ThemeNotifacationName = NSNotification.Name("ThemeUpdateNotification")

// 工厂模式
enum ThemeType: Int {
    case defaultTheme = 0
    case darkTheme
    var theme : ThemeProtocol {
        get {
            switch self {
            case .defaultTheme:
                return DefaultTheme()
            case .darkTheme:
                return DarkTheme()
            }
        }
    }
    var themeIndex : Int {
        get {
            switch self {
            case .defaultTheme:
                return 0
            case .darkTheme:
                return 1
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
        NotificationCenter.default.post(name: ThemeNotifacationName, object: shareInstance().theme)
    }
    
    
    // MARK--- Private Func
    
    private override init() {
        guard let index = userDefault.object(forKey: Common.Data.themeKey) as? Int else {
            return
        }
        self.theme = ThemeType.init(rawValue: index)?.theme ?? DefaultTheme()
    }
    
    private func switcherTheme (_ type: ThemeType) {
        self.theme = type.theme
        userDefault.set(self.theme.Index, forKey: Common.Data.themeKey)
        NotificationCenter.default.post(name: ThemeNotifacationName, object: self.theme)
    }
}
