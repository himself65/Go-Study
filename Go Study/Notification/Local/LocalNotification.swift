//
//  LocalNotification.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/6.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UserNotifications
import CoreData

class LocalNotification: NSObject {
    
    class func addNotification(_ title: String, subTitle: String? = nil, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        if subTitle != nil {
            content.subtitle = subTitle!
        }
        content.body = body
        content.sound = UNNotificationSound.default()
        
        // 时间
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // 注册请求
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in print("shit")})
    }
}
