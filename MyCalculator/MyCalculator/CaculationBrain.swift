//
//  CaculationBrain.swift
//  MyCalculator
//
//  Created by haiki on 11/8/17.
//  Copyright © 2017 haiki. All rights reserved.
//

import Foundation

class CaculationBrain {
    private var opStack = Array<String>()
    private var digitStack = Array<Double>()
    func pushOperator(operand: String) {
        opStack.append(operand)
    }
    func pushDigit(digit: String){
        digitStack.append(NumberFormatter().number(from: digit)!.doubleValue)
    }
    func getComputation(num: String) -> Double? {
        let curNum = NumberFormatter().number(from: num)!.doubleValue
        if opStack.count == 1 && digitStack.count == 1 {
            let preNum = digitStack.removeLast()
            let op = opStack.removeLast()
            var rst = 0.0
            switch op {
            case "+" :
                rst = preNum + curNum
            case "-" :
                rst = preNum - curNum
            case "*" :
                rst = preNum * curNum
            case "/" :
                rst = preNum / curNum
            default:break
            }
            return rst
        } else if digitStack.count > 0 {
            return digitStack.last
        } else {
            return nil
        }
    }
}
