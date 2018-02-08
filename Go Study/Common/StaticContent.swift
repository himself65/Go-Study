//
//  StaticContent.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/8.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation

class StaticContent {
    static let homeDirectory = NSHomeDirectory()
    static let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    static let libraryPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    static let cachesPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    static let tmpDir = NSTemporaryDirectory()
    static let userDefault = UserDefaults.standard
}
