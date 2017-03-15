//
//  ViewController.swift
//  tipster
//
//  Created by Justin Chang on 3/8/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var subtotal:String?
    var decimal = -1
    var groupSize:Int = 1
    var lowPercent:Double = 0.00
    var midPercent:Double = 0.05
    var highPercent:Double = 0.10
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var lowPercentLabel: UILabel!
    @IBOutlet weak var lowTipLabel: UILabel!
    @IBOutlet weak var lowTotalLabel: UILabel!
    @IBOutlet weak var midPercentLabel: UILabel!
    @IBOutlet weak var midTipLabel: UILabel!
    @IBOutlet weak var midTotalLabel: UILabel!
    @IBOutlet weak var highPercentLabel: UILabel!
    @IBOutlet weak var highTipLabel: UILabel!
    @IBOutlet weak var highTotalLabel: UILabel!
    @IBAction func tipChange(_ sender: UISlider) {
        let roundedValue = round(sender.value*100)/100
        sender.value = roundedValue
        lowPercent = Double(sender.value) - 0.05
        midPercent = Double(sender.value)
        highPercent = Double(sender.value) + 0.05
        updateUI()
    }
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBAction func groupSizeChange(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        groupSize = Int(sender.value)
        groupSizeLabel.text = "Group Size: \(Int(roundedValue))"
        updateUI()
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        print (sender.tag)
        if let sub = subtotal {
            if(decimal < 2) {
                subtotal = sub + String(sender.tag)
                if decimal != -1 {
                    decimal += 1
                }
            }
        }
        else {
            subtotal = String(sender.tag)
        }
        updateUI()
    }

    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        if decimal == -1 {
            decimal = 0
            if let sub = subtotal {
                subtotal = sub + "."
            }
            else {
                subtotal = "0."
            }
        }
        updateUI()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        subtotal = nil
        decimal = -1
        groupSize = 1
        lowPercent = 0.00
        midPercent = 0.05
        highPercent = 0.10
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI() {
        if let sub = subtotal {
            subtotalLabel.text = sub
            print(Double(sub)!)
        }
        else {
            subtotalLabel.text = ""
        }
        lowPercentLabel.text = String(Int(floor(lowPercent*100)))+"%"
        midPercentLabel.text = String(Int(floor(midPercent*100)))+"%"
        highPercentLabel.text = String(Int(floor(highPercent*100)))+"%"
        if let sub = subtotal {
            lowTipLabel.text = String(format:"%.2f", (Double(sub)! * lowPercent))
            midTipLabel.text = String(format:"%.2f", (Double(sub)! * midPercent))
            highTipLabel.text = String(format:"%.2f", (Double(sub)! * highPercent))
            lowTotalLabel.text = String(format:"%.2f", (Double(sub)! * (lowPercent+1)/Double(groupSize)))
            midTotalLabel.text = String(format:"%.2f", (Double(sub)! * (midPercent+1)/Double(groupSize)))
            highTotalLabel.text = String(format:"%.2f", (Double(sub)! * (highPercent+1)/Double(groupSize)))
        }
    }
}

