//
//  ViewController.swift
//  Tips
//
//  Created by Robert Honsby on 9/3/15.
//  Copyright (c) 2015 Honsby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.2, 0.22]
    let currencyFormatter = CurrencyFormatter()
    let defaultTextValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelText(defaultTextValue, total: defaultTextValue)
        setTipAsUserDefault()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if SettingsManager.getDefaultTipChanged() {
            setTipAsUserDefault()
        }
        
        updateViewWithTipAndTotal()
        focusOnBillField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateViewWithTipAndTotal()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateViewWithTipAndTotal() {
        var billAmount = getBillAmount()
        var tip = billAmount * getTipPercentage()
        var total = billAmount + tip
        
        setLabelText(tip, total: total)
    }
    
    func setLabelText(tip: Double, total: Double) {
        tipLabel.text = currencyFormatter.stringFromNumber(tip);
        totalLabel.text = currencyFormatter.stringFromNumber(total);
    }
    
    func setTipAsUserDefault() {
        tipControl.selectedSegmentIndex = SettingsManager.getDefaultSegIndex()
    }
    
    func focusOnBillField() {
        billField.becomeFirstResponder()
    }
    
    func getTipPercentage() -> Double {
        return tipPercentages[tipControl.selectedSegmentIndex]
    }
    
    func getBillAmount() -> Double {
        return billField.text._bridgeToObjectiveC().doubleValue
    }
}