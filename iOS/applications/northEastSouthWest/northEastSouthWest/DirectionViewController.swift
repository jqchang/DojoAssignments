//
//  DirectionViewController.swift
//  northEastSouthWest
//
//  Created by Justin Chang on 3/15/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "directionPressedSegue", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let direction = sender as! UIButton
        let destController = segue.destination as! UINavigationController
        let dest = destController.topViewController as! DirLabelViewController
        switch(direction.tag) {
        case 1:
            dest.direction = "NORTH"
        case 2:
            dest.direction = "EAST"
        case 3:
            dest.direction = "SOUTH"
        case 4:
            dest.direction = "WEST"
        default:
            break;
        }

        print(direction.tag)
    }
    @IBAction func unwindToMenu(segue:UIStoryboardSegue){}

}
