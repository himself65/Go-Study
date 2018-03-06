//
//  SettingBundleHelper.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/8.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
extension Common {
    struct UserDefault {
        static let IdKey = "id"
        static let alwaysOnScreenKey = Common.alwaysOnScreenKey
        static let cannotUsePhoneKey = Common.cannotUsePhoneKey
    }
}

class SettingsBundleHelper {
    struct SettingsBundleKeys {
        static let BuildVersionKey = "build_preference"
        static let AppVersionKey = "version_preference"
    }
    
    // MARK - When First Launch App, Do this Function
    class func setDefaultSetting() {
        userDefault.set(25, forKey: "defaultDuration")
        userDefault.set(1, forKey: Common.UserDefault.IdKey)
        userDefault.set(false, forKey: Common.UserDefault.alwaysOnScreenKey)
        userDefault.set(false, forKey: Common.UserDefault.cannotUsePhoneKey)
        userDefault.set(0, forKey: Common.Data.themeKey)
    }
    
    // MARK - Get version
    class func setVersionAndBuildNumber() {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: "version_preference")
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: "build_preference")
    }
}
