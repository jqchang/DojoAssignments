//
//  BinaryCell.swift
//  binaryCounter
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class BinaryCell: UITableViewCell {
    @IBOutlet weak var binaryLabel: UILabel!
    
    var mathDelegate:MathDelegate?

    @IBAction func buttonPressed(_ sender: Any) {
        let mode = (sender as! UIButton).titleLabel?.text
        let num = Int(self.binaryLabel.text!)
        if mode == "-" {
            mathDelegate?.buttonWasPressed(value: -num!)
        }
        else {
            mathDelegate?.buttonWasPressed(value: num!)
        }
    }
}
