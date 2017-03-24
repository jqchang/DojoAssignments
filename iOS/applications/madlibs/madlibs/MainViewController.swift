//
//  MainViewController.swift
//  madlibs
//
//  Created by Justin Chang on 3/16/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SubmitDelegate {
    @IBOutlet weak var madlibLabel: UILabel!
    var words:[String]?
    
    func submitButtonWasPressed(controller: UIViewController, wordBank: [String]) {
        if(wordBank != ["","","",""]){
            madlibLabel.text = "We are having a perfectly \(wordBank[0]) time now. Later we will \(wordBank[1]) and \(wordBank[2]) in the \(wordBank[3])"
        }
        else {
            madlibLabel.text = "..."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = (segue.destination as! UINavigationController).topViewController as! FormViewController
        dest.submitDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let wordbank = words {
            madlibLabel.text = "We are having a perfectly \(wordbank[0]) time now. Later we will \(wordbank[1]) and \(wordbank[2]) in the \(wordbank[3])"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
}
