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
    static private let defaultTipChangedKey = "defaultTipChanged"
   
    static func getDefaultSegIndex() -> Int {
        return userDefaults.integerForKey(defaultSegIndexKey);
    }
    
    static func getDefaultTipChanged() -> Bool {
        return userDefaults.boolForKey(defaultTipChangedKey)
    }
    
    static func setDefaultSegIndex(index: Int) {
        userDefaults.setInteger(index, forKey: defaultSegIndexKey)
        userDefaults.synchronize()
    }
    
    static func setDefaultTipChanged(didUpdate: Bool) {
        userDefaults.setBool(didUpdate, forKey: defaultTipChangedKey)
        userDefaults.synchronize()
    }
}
