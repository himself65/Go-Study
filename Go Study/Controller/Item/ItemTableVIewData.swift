//
//  ItemData.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/23.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import UIKit

func loadData_Test() -> [[String]] {
    var _data = Array<[String]>()
    var item = Array<String>()
    
    
    for i in 1...3 {
        for _ in 1...10
        {
            item.append("\(i)")
        }
        _data.append(item)
        item = Array<String>()
    }
    
    return _data
}
