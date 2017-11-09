//
//  ViewController.swift
//  MyCalculator
//
//  Created by haiki on 11/8/17.
//  Copyright © 2017 haiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var caculator = CaculationBrain()
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyTyping = display.text!
            display.text = textCurrentlyTyping + digit
        } else {
            display.text = digit
        }
        userIsTyping = true;
    }
    @IBAction func enterOperator(_ sender: UIButton) {
        userIsTyping = false
        caculator.pushDigit(digit: display.text!)
        caculator.pushOperator(operand: sender.currentTitle!)
        display.text = sender.currentTitle
    }
    
    @IBAction func getRst(_ sender: UIButton) {
        userIsTyping = false
        if let rst = caculator.getComputation(num: display.text!) {
            display.text = "\(rst)"
        } else {
            display.text = "\(0)"
        }
    }
}

