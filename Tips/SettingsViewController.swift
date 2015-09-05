//
//  SettingsViewController.swift
//  Tips
//
//  Created by Robert Honsby on 9/3/15.
//  Copyright (c) 2015 Honsby. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipsControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipsSegment()
        SettingsManager.setDefaultTipChanged(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onDefaultTipChange(sender: AnyObject) {
        var selectedSegment = defaultTipsControl.selectedSegmentIndex
        
        if selectedSegment != SettingsManager.getDefaultSegIndex() {
            SettingsManager.setDefaultTipChanged(true)
            SettingsManager.setDefaultSegIndex(selectedSegment)
        }
    }
    
    func setTipsSegment() {
        defaultTipsControl.selectedSegmentIndex = SettingsManager.getDefaultSegIndex()
    }
}