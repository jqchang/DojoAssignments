//
//  ViewController.swift
//  CustomCell
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class CustomCellsViewController: UITableViewController {
    var nums = [1, 90, 32, 23, 9, 12]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.customLabel?.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24 {
            cell.customButton?.backgroundColor = UIColor.green
        } else {
            cell.customButton?.backgroundColor = UIColor.red
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
}

