//
//  BucketListTableViewController.swift
//  bucketListCrud
//
//  Created by Justin Chang on 3/15/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController {
    var items = ["10 quart bucket", "5 quart bucket", "2.5 quart bucket", "5 quart metal bucket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionCell", for: indexPath)
        return cell
    }
}
