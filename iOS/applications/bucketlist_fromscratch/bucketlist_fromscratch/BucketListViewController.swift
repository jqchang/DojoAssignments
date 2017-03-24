//
//  BucketListViewController.swift
//  bucketlist_fromscratch
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, SaveButtonDelegate, CancelButtonDelegate {
    var items = [String]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveButtonWasPressed(controller: UIViewController, text: String, editing: Int) {
        if editing == -1 {
            let newBucket = Bucket(context: context)
            newBucket.name = text
            items.append(text)
        }
        else {
            let bucketRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
            do {
                let bucketlist = try context.fetch(bucketRequest)
                bucketlist[editing].name = text
            } catch { print("Error") }
        }
        do {
            try context.save()
        } catch { print("Error") }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonWasPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = (segue.destination as! UINavigationController).topViewController as! AddItemViewController
        dest.saveDelegate = self
        dest.cancelDelegate = self
        if let sendTuple = sender as? editTarget {
            dest.editIndex = sendTuple.targetIndex
            dest.inputString = sendTuple.targetStr
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bucketRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
        do {
            let bucketlist = try context.fetch(bucketRequest)
            return bucketlist.count
        }
        catch { print(error) }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bucketRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        do {
            let bucketlist = try context.fetch(bucketRequest)
            cell.textLabel?.text = bucketlist[indexPath.row].name
        }
        catch { print(error) }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let bucketRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
        do {
            let bucketlist = try context.fetch(bucketRequest)
            context.delete(bucketlist[indexPath.row])
            try context.save()
        }
        catch { print(error) }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let bucketRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
        do {
            let bucketlist = try context.fetch(bucketRequest)
            let str = bucketlist[indexPath.row].name
            // Swift no like tuples - made own struct to act like a tuple
            performSegue(withIdentifier: "EditItem", sender: editTarget(targetIndex: indexPath.row, targetStr: str!))
        }
        catch { print(error) }
    }
    
}
