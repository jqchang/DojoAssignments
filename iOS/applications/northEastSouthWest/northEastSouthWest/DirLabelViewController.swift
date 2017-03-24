//
//  DirLabelViewController.swift
//  northEastSouthWest
//
//  Created by Justin Chang on 3/15/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class DirLabelViewController: UIViewController {
    
    @IBOutlet weak var directionLabel: UILabel!
    var direction:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionLabel.text = direction
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
}
