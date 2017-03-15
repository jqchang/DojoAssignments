//
//  ViewController.swift
//  greatNumberGame
//
//  Created by Justin Chang on 3/9/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var answer:Int = Int(arc4random_uniform(101))
    @IBOutlet weak var guessField: UITextField!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessField.text {
            if let guessNum = Int(guess) {
                if(guessNum < answer) {
                    let alert = UIAlertController(title: "Incorrect", message: "\(guess) is too low.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default))
                    self.present(alert, animated: true, completion:nil)
                }
                else if(guessNum > answer) {
                    let alert = UIAlertController(title: "Incorrect", message: "\(guess) is too high.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default))
                    self.present(alert, animated: true, completion:nil)
                }
                else {
                    let alert = UIAlertController(title: "Correct", message: "\(guess) is correct!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"New Game", style: UIAlertActionStyle.default))
                    self.present(alert, animated: true, completion:newRand)
                }
            }
        }
    }
    func newRand() {
        answer = Int(arc4random_uniform(101))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

