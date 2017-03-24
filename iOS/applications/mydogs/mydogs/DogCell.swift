//
//  DogCell.swift
//  mydogs
//
//  Created by Justin Chang on 3/21/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class DogCell: UICollectionViewCell {
    var editDelegate:EditDelegate?
    var primaryKey:Int?
    @IBOutlet weak var dogNameLabel: UIButton!
    
    @IBAction func dogNamePressed(_ sender: Any) {
        print(dogNameLabel.titleLabel?.text)
        editDelegate?.editButtonPressed(sender: self)
    }
}
