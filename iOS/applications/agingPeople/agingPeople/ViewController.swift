//
//  ViewController.swift
//  agingPeople
//
//  Created by Justin Chang on 3/14/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var names = ["Allan", "Tara", "Rhonda", "Laverne", "Victoria", "Shelley", "Deborah", "Rogelio", "Amy", "Alton", "Suzanne", "Melba"]
    var ages = [Int]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        for _ in 0..<names.count {
            ages.append(Int(arc4random_uniform(91))+5)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.detailTextLabel?.text = String(ages[indexPath.row])+" years old"
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        names.remove(at: indexPath.row)
        ages.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
