//
//  AlertActionSwift.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/2.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

extension UIResponder {
    @discardableResult
    func alertShow(_ title: String, message: String, style: UIAlertControllerStyle, leftContent: ActionContent, rightContent: ActionContent) -> UIAlertController {
        return SwiftAlertAction.alertAction(title, message: message, style: style, leftContent: leftContent, rightContent: rightContent)
    }
    
}

struct ActionContent {
    var title: String
    var style: UIAlertActionStyle
    var handler: ((UIAlertAction) -> Void)?
}

class SwiftAlertAction: NSObject {
    
    @discardableResult
    static func alertAction(_ title: String, message: String, style: UIAlertControllerStyle, leftContent: ActionContent, rightContent: ActionContent) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let leftAction = UIAlertAction(title: leftContent.title, style: leftContent.style, handler: leftContent.handler)
        let rightAction = UIAlertAction(title: rightContent.title, style: rightContent.style, handler: rightContent.handler)
        
        alertController.addAction(leftAction)
        alertController.addAction(rightAction)
        
        return alertController
    }
}
