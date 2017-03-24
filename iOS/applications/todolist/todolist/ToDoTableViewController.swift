//
//  ViewController.swift
//  todolist
//
//  Created by Justin Chang on 3/21/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController, AddDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let thingRequest:NSFetchRequest<Task> = Task.fetchRequest()
        do { items = try context.fetch(thingRequest) }
        catch { print(error) }
    }
    
    func addButtonPressed() {
        // Do any additional setup after loading the view, typically from a nib.
        let thingRequest:NSFetchRequest<Task> = Task.fetchRequest()
        do { items = try context.fetch(thingRequest) }
        catch { print(error) }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CreateItemViewController
        dest.addDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].done = !items[indexPath.row].done
        let cell = tableView.cellForRow(at: indexPath) as! ToDoTableCell
        cell.doneLabel.isHidden = !items[indexPath.row].done
        do { try context.save(); print("Saved!") }
        catch { print(error) }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ToDoTableCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/YYYY"
        let strDate = dateFormatter.string(from: items[indexPath.row].date as! Date)
        cell.dateLabel.text = strDate
        cell.titleLabel.text = items[indexPath.row].title
        cell.descriptionLabel.text = items[indexPath.row].desc
        cell.doneLabel.isHidden = !items[indexPath.row].done
        return cell
    }
}

