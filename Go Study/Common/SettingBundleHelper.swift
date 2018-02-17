//
//  SettingBundleHelper.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/8.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation

class SettingsBundleHelper {
    struct SettingsBundleKeys {
        static let BuildVersionKey = "build_preference"
        static let AppVersionKey = "version_preference"
    }
    
    class func setDefaultSetting() {
        UserDefaults.standard.set("Himself65", forKey: "userName")
        UserDefaults.standard.set(16, forKey: "userAge")
        UserDefaults.standard.set(11, forKey: "userGrade")
    }
    
    class func setVersionAndBuildNumber() {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: "version_preference")
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: "build_preference")
    }
}
