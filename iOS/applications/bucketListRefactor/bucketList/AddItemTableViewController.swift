//
//  AddItemTableViewController.swift
//  bucketList
//
//  Created by Justin Chang on 3/14/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    weak var delegate: AddItemTableViewControllerDelegate?
    var item:String?
    var indexPath:IndexPath?
    
    @IBAction func cancelButonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        let text = inputField.text!
        delegate?.itemSaved(by: self, with:text, at: indexPath)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.text = item
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

