//
//  CurrencyFormatter.swift
//  Tips
//
//  Created by Robert Honsby on 9/4/15.
//  Copyright (c) 2015 Honsby. All rights reserved.
//

import UIKit

class CurrencyFormatter: NSObject {
    private var formatter: NSNumberFormatter
    
    override init() {
        formatter = NSNumberFormatter()
        formatter.locale = NSLocale.currentLocale()
        formatter.numberStyle = .CurrencyStyle
    }
    
    func stringFromNumber(number: Double) -> String! {
        return formatter.stringFromNumber(number);
    }
}