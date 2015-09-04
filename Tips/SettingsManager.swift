//
//  SettingsManager.swift
//  Tips
//
//  Created by Robert Honsby on 9/4/15.
//  Copyright (c) 2015 Honsby. All rights reserved.
//

import UIKit

class SettingsManager: NSObject {
    static private var userDefaults = NSUserDefaults.standardUserDefaults()
    static private let defaultSegIndexKey = "defaultSegmentIndex"
   
    static func getDefaultSegIndex() -> Int {
        return userDefaults.integerForKey(defaultSegIndexKey);
    }
    
    static func setDefaultSegIndex(index: Int) {
        userDefaults.setInteger(index, forKey: defaultSegIndexKey)
        userDefaults.synchronize()
    }
}
