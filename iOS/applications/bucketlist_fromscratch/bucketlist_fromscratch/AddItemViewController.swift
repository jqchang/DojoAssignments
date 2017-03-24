//
//  AddItemViewController.swift
//  bucketlist_fromscratch
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    var editIndex:Int?
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        cancelDelegate?.cancelButtonWasPressed()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let edit = editIndex {
            saveDelegate?.saveButtonWasPressed(controller: self, text: inputField.text!, editing: edit)
        }
        else {
            saveDelegate?.saveButtonWasPressed(controller: self, text: inputField.text!, editing: -1)
        }
    }
    
    var inputString:String?
    var saveDelegate:SaveButtonDelegate?
    var cancelDelegate: CancelButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let input = inputString {
            inputField.text = input
        }
    }
}
