//
//  ViewController.swift
//  calculator
//
//  Created by Justin Chang on 3/9/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num1:Double?;
    var num2:Double?;
    var decimal = false;
    var final = false;
    var op:Int?;
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        num1 = nil
        num2 = nil
        decimal = false
        final = false
        op = nil
        numLabel.text = "0"
    }
    
    @IBAction func negButtonPressed(_ sender: UIButton) {
        let neg = -1 * Double(numLabel.text!)!
        numLabel.text = String(neg)
    }
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        numLabel.text = String(Double(numLabel.text!)!/100)
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if final {
            reset()
        }
        if let _ = numLabel.text {
            if numLabel.text == "0" {
                numLabel.text = String(sender.tag)
            }
            else {
                numLabel.text!.append(String(sender.tag))
            }
        }
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        if !decimal {
            decimal = true
            if let _ = numLabel.text {
                numLabel.text!.append(".")
            }
            else {
                numLabel.text = "0."
            }
        }
    }
    
    @IBAction func opButtonPressed(_ sender: UIButton) {
        if num1 == nil {
            num1 = Double(numLabel.text!)
        }
        else {
            num2 = Double(numLabel.text!)
        }
        if let oper = op {
            num1 = calculate(op:oper)
            num2 = nil
        }
        op = sender.tag
        numLabel.text = "0"
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        final = true
        if num1 == nil {
            num1 = Double(numLabel.text!)
        }
        else if num2 == nil {
            num2 = Double(numLabel.text!)
        }
        if let oper = op {
            numLabel.text = String(calculate(op:oper))
        }
        op = nil
    }
    
    func calculate(op:Int) -> Double {
        switch(op) {
        case 1:
            return calculate(operation:divide)
        case 2:
            return calculate(operation:multiply)
        case 3:
            return calculate(operation:subtract)
        case 4:
            return calculate(operation:add)
        default:
            return 0;
        }
    }
    
    func calculate(operation: (Double, Double) -> Double) -> Double{
        if let n1 = num1, let n2 = num2 {
            return operation(n1,n2)
        }
        else if let n1 = num1 {
            return n1
        }
        else {
            return 0
        }
    }
    
    func add(arg1:Double, arg2:Double) -> Double{
        return arg1 + arg2
    }
    func subtract(arg1:Double, arg2:Double) -> Double{
        return arg1 - arg2
    }
    func multiply(arg1:Double, arg2:Double) -> Double{
        return arg1 * arg2
    }
    func divide(arg1:Double, arg2:Double) -> Double{
        return arg1 / arg2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

