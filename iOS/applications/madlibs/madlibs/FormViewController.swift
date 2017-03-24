//
//  FormViewController.swift
//  madlibs
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class FormViewController: UITableViewController {
    var submitDelegate:SubmitDelegate?
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        submitDelegate?.submitButtonWasPressed(controller: self, wordBank: [textField1.text!, textField2.text!, textField3.text!, textField4.text!])
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
