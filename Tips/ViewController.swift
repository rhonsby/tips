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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultText()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setTipAsUserDefault()
        updateViewWithTipAndTotal()
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
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setDefaultText() {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    func setTipAsUserDefault() {
        tipControl.selectedSegmentIndex = SettingsManager.getDefaultSegIndex()
    }
}