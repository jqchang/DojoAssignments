//
//  ViewController.swift
//  tictactoe
//
//  Created by Justin Chang on 3/7/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var turn = 0
    var lock = false
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var button00Label: UIButton!
    @IBOutlet weak var button01Label: UIButton!
    @IBOutlet weak var button02Label: UIButton!
    @IBOutlet weak var button10Label: UIButton!
    @IBOutlet weak var button11Label: UIButton!
    @IBOutlet weak var button12Label: UIButton!
    @IBOutlet weak var button20Label: UIButton!
    @IBOutlet weak var button21Label: UIButton!
    @IBOutlet weak var button22Label: UIButton!
    func checkWinner() {
        // Win condition 1 - Horizontal 1
        if(!button00Label.backgroundColor!.isEqual(UIColor.lightGray) && button00Label.backgroundColor!.isEqual(button01Label.backgroundColor!) && button00Label.backgroundColor!.isEqual(button02Label.backgroundColor!)) {
            print("Win condition 1 triggered")
            updateWinner(winner: button00Label.backgroundColor!)
        }
        // Win condition 2 - Horizontal 2
        else if(!button10Label.backgroundColor!.isEqual(UIColor.lightGray) && button10Label.backgroundColor!.isEqual(button11Label.backgroundColor!) && button10Label.backgroundColor!.isEqual(button12Label.backgroundColor!)) {
            print("Win condition 2 triggered")
            updateWinner(winner: button10Label.backgroundColor!)
        }
        // Win condition 3 - Horizontal 3
        else if (!button20Label.backgroundColor!.isEqual(UIColor.lightGray) && button20Label.backgroundColor!.isEqual(button21Label.backgroundColor!) && button20Label.backgroundColor!.isEqual(button22Label.backgroundColor!)) {
            print("Win condition 3 triggered")
            updateWinner(winner: button20Label.backgroundColor!)
        }
        // Win condition 4 - Vertical 1
        else if (!button00Label.backgroundColor!.isEqual(UIColor.lightGray) && button00Label.backgroundColor!.isEqual(button10Label.backgroundColor!) && button00Label.backgroundColor!.isEqual(button20Label.backgroundColor!)) {
            print("Win condition 4 triggered")
            updateWinner(winner: button00Label.backgroundColor!)
        }
        // Win condition 5 - Vertical 2
        else if (!button01Label.backgroundColor!.isEqual(UIColor.lightGray) && button01Label.backgroundColor!.isEqual(button11Label.backgroundColor!) && button01Label.backgroundColor!.isEqual(button21Label.backgroundColor!)) {
            print("Win condition 5 triggered")
            updateWinner(winner: button01Label.backgroundColor!)
        }
        // Win condition 6 - Vertical 3
        else if (!button02Label.backgroundColor!.isEqual(UIColor.lightGray) && button02Label.backgroundColor!.isEqual(button12Label.backgroundColor!) && button02Label.backgroundColor!.isEqual(button22Label.backgroundColor!)) {
            print("Win condition 6 triggered")
            updateWinner(winner: button02Label.backgroundColor!)
        }
        // Win condition 7 - Diagonal 1
        else if (!button00Label.backgroundColor!.isEqual(UIColor.lightGray) && button00Label.backgroundColor!.isEqual(button11Label.backgroundColor!) && button00Label.backgroundColor!.isEqual(button22Label.backgroundColor!)) {
            print("Win condition 7 triggered")
            updateWinner(winner: button00Label.backgroundColor!)
        }
        // Win condition 8 - Diagonal 2
        else if (!button02Label.backgroundColor!.isEqual(UIColor.lightGray) && button02Label.backgroundColor!.isEqual(button11Label.backgroundColor!) && button02Label.backgroundColor!.isEqual(button20Label.backgroundColor!)) {
            print("Win condition 8 triggered")
            updateWinner(winner: button02Label.backgroundColor!)
        }
        else if (turn == 9) {
            updateWinner(winner: UIColor.lightGray)
            print(turn)
        }
    }
    func updateWinner(winner:UIColor) {
        lock = true
        if winner == UIColor.lightGray {
            winnerLabel.text = "Tie!"
            winnerLabel.textColor = UIColor.black
        }
        else if winner == UIColor.red {
            winnerLabel.text = "Red player wins!"
            winnerLabel.textColor = UIColor.red
        }
        else {
            winnerLabel.text = "Blue player wins!"
            winnerLabel.textColor = UIColor.blue
        }
        
    }
    @IBAction func button00Pressed(_ sender: UIButton) {
        if (!lock && button00Label.backgroundColor != UIColor.red && button00Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button00Label.backgroundColor = UIColor.red
            }
            else {
                button00Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }

    @IBAction func button01Pressed(_ sender: UIButton) {
        if (!lock && button01Label.backgroundColor != UIColor.red && button01Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button01Label.backgroundColor = UIColor.red
            }
            else {
                button01Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button02Pressed(_ sender: UIButton) {
        if (!lock && button02Label.backgroundColor != UIColor.red && button02Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button02Label.backgroundColor = UIColor.red
            }
            else {
                button02Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button10Pressed(_ sender: UIButton) {
        if (!lock && button10Label.backgroundColor != UIColor.red && button10Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button10Label.backgroundColor = UIColor.red
            }
            else {
                button10Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button11Pressed(_ sender: UIButton) {
        if (!lock && button11Label.backgroundColor != UIColor.red && button11Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button11Label.backgroundColor = UIColor.red
            }
            else {
                button11Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button12Pressed(_ sender: UIButton) {
        if (!lock && button12Label.backgroundColor != UIColor.red && button12Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button12Label.backgroundColor = UIColor.red
            }
            else {
                button12Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button20Pressed(_ sender: UIButton) {
        if (!lock && button20Label.backgroundColor != UIColor.red && button20Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button20Label.backgroundColor = UIColor.red
            }
            else {
                button20Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button21Pressed(_ sender: UIButton) {
        if (!lock && button21Label.backgroundColor != UIColor.red && button21Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button21Label.backgroundColor = UIColor.red
            }
            else {
                button21Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func button22Pressed(_ sender: UIButton) {
        if (!lock && button22Label.backgroundColor != UIColor.red && button22Label.backgroundColor != UIColor.blue) {
            print("Changing color!")
            if turn % 2 == 0 {
                button22Label.backgroundColor = UIColor.red
            }
            else {
                button22Label.backgroundColor = UIColor.blue
            }
            turn += 1
        }
        checkWinner()
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    func reset() {
        button00Label.backgroundColor = UIColor.lightGray;
        button01Label.backgroundColor = UIColor.lightGray;
        button02Label.backgroundColor = UIColor.lightGray;
        button10Label.backgroundColor = UIColor.lightGray;
        button11Label.backgroundColor = UIColor.lightGray;
        button12Label.backgroundColor = UIColor.lightGray;
        button20Label.backgroundColor = UIColor.lightGray;
        button21Label.backgroundColor = UIColor.lightGray;
        button22Label.backgroundColor = UIColor.lightGray;
        winnerLabel.text = ""
        lock = false
        turn = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

