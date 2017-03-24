//
//  ViewController.swift
//  persistData
//
//  Created by Justin Chang on 3/16/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSCoding {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let thing = NSEntityDescription.insertNewObject(forNewEntity: "persistData", in
    
    @IBAction func buttonPressed(_ sender: Any) {
        textLabel.text = inputText.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func encode(with aCoder: NSCoder) {
        textLabel.text
    }
    

}

