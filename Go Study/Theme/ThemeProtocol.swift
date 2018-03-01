//
//  ThemeProtocol.swift
//  Go Study
//
//  Created by Himself65 on 2018/3/1.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

protocol ThemeProtocol {
    var PrimaryColor: UIColor {get}
    var LightPrimaryColor: UIColor {get}
    var DarkPrimaryColor: UIColor {get}
    var Text_Icon: UIColor {get}
    var AccentColor: UIColor {get}
    var PrimaryText: UIColor {get}
    var SecondText: UIColor {get}
    var DividerText: UIColor {get}
}
