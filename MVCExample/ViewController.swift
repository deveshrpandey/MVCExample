//
//  ViewController.swift
//  MVCExample
//
//  Created by Samuel Goodwin on 11/8/14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

import UIKit

struct Model {
    let leftSideInput: String
    let rightSideInput: String
    
    func leftSideValue() -> Int {
        return leftSideInput.toInt()!
    }
    
    func rightSideValue() -> Int {
        return rightSideInput.toInt()!
    }
}

func determineResult(model: Model) -> String {
    let formatter = NSNumberFormatter()
    formatter.locale = NSLocale.currentLocale()
    formatter.numberStyle = .DecimalStyle
    
    let leftSideString = formatter.stringFromNumber(model.leftSideValue())!
    let rightSideString = formatter.stringFromNumber(model.rightSideValue())!
    
    if model.leftSideValue() > model.rightSideValue() {
        return "\(leftSideString) > \(rightSideString)"
    } else {
        return "\(leftSideString) < \(rightSideString)"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var leftSideField: UITextField!
    @IBOutlet weak var rightSideField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculate(sender: UIButton) {
        let model = Model(leftSideInput: leftSideField.text, rightSideInput: rightSideField.text)
        
        resultLabel.text = determineResult(model)
    }
}

