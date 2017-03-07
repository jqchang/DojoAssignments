//
//  ViewController.swift
//  cold_call_v1
//
//  Created by Justin Chang on 3/7/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var names = ["Uyanga", "Courtney", "Bryant", "Jimmy", "Ryota", "Cody", "Jay"]
    var nameIndex = 0;
    var num = 0;
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBAction func callButtonPressed(_ sender: Any) {
        nameIndex = Int(arc4random_uniform(UInt32(names.count)))
        num = Int(arc4random_uniform(5)+1)
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.isHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateUI() {
        nameLabel.text = names[nameIndex]
        numLabel.text = String(num)
        if numLabel.text != "0" {
            numLabel.isHidden = false;
        }
        switch num {
        case 1, 2:
            numLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            break;
        case 3, 4:
            numLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break;
        default:
            numLabel.textColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

