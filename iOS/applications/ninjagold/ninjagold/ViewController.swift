//
//  ViewController.swift
//  ninjagold
//
//  Created by Justin Chang on 3/7/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    var score:Int = 0;
    var gains:Int = 0;
    
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    @IBAction func farmButtonPressed(_ sender: UIButton) {
        gains = Int(arc4random_uniform(11))+10
        updateUI(location:"farm")
    }
    @IBAction func caveButtonPressed(_ sender: UIButton) {
        gains = Int(arc4random_uniform(6))+5
        updateUI(location:"cave")
    }
    @IBAction func houseButtonPressed(_ sender: UIButton) {
        gains = Int(arc4random_uniform(4))+2
        updateUI(location:"house")
    }
    @IBAction func casinoButtonPressed(_ sender: UIButton) {
        gains = Int(arc4random_uniform(101))-50
        updateUI(location:"casino")
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        gains = -score
        updateUI(location:"reset")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        farmLabel.isHidden = true;
        caveLabel.isHidden = true;
        houseLabel.isHidden = true;
        casinoLabel.isHidden = true;
    }
    
    func updateUI(location l:String) {
        farmLabel.isHidden = true;
        caveLabel.isHidden = true;
        houseLabel.isHidden = true;
        casinoLabel.isHidden = true;
        score += gains;
        scoreLabel.text = "Score: \(score)"
        var gaintext:String
        if gains > 0 {
            gaintext = "You earned \(gains) golds"
        }
        else {
            gaintext = "You lost \(gains) golds"
        }
        switch l {
        case "farm":
            farmLabel.text = gaintext
            farmLabel.isHidden = false;
            break;
        case "cave":
            caveLabel.text = gaintext
            caveLabel.isHidden = false;
            break;
        case "house":
            houseLabel.text = gaintext
            houseLabel.isHidden = false;
            break;
        case "casino":
            casinoLabel.text = gaintext
            casinoLabel.isHidden = false;
            break;
        default:
            break;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

