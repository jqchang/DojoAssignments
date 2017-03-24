//
//  ViewController.swift
//  binaryCounter
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class BinaryTableViewController: UITableViewController, MathDelegate {
    @IBOutlet weak var totalLabel: UILabel!
    var total:Int = 0
    var numRows:Int = 16

    func buttonWasPressed(value: Int) {
        total += value
        totalLabel.text = "Total: \(total)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return numRows;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinaryCell", for: indexPath) as! BinaryCell
        totalLabel.text = "Total: \(total)"
        cell.binaryLabel?.text = "\(pow(10, indexPath.row))"
        cell.mathDelegate = self
        return cell
    }

}

