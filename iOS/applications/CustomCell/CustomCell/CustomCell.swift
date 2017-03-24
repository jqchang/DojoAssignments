//
//  CustomCell.swift
//  CustomCell
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit
class CustomCell: UITableViewCell {
    
    @IBOutlet weak var customLabel: UILabel!
    @IBAction func customButtonPressed(_ sender: Any) {
        print(customLabel?.text)
    }
    @IBOutlet weak var customButton: UIButton!
}
