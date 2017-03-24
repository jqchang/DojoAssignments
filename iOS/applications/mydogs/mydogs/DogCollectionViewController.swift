//
//  DogCollectionViewController.swift
//  mydogs
//
//  Created by Justin Chang on 3/21/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit
import CoreData

class DogCollectionViewController: UICollectionViewController, AddDelegate, EditDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var doggies = [Dog]()

    func addButtonPressed() {
        print("Add button pressed!")
        let dogRequest:NSFetchRequest<Dog> = Dog.fetchRequest()
        do { doggies = try context.fetch(dogRequest) }
        catch { print(error) }
        self.collectionView!.reloadData()
    }
    
    func editButtonPressed(sender: DogCell) {
        print(sender.primaryKey!)
        print(doggies[sender.primaryKey!])
        performSegue(withIdentifier: "AddEdit", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = (segue.destination as! UINavigationController).topViewController as! AddDogViewController
        if let send = sender! as? DogCell {
            dest.name = doggies[send.primaryKey!].name!
            dest.color = doggies[send.primaryKey!].color!
            dest.food = doggies[send.primaryKey!].food!
            if let img = doggies[send.primaryKey!].image {
                dest.image = UIImage(data: img as Data, scale:1.0)
            }
            dest.targetIndex = send.primaryKey!
            dest.addDelegate = self
            dest.edit = true
        }
        else {
            dest.addDelegate = self
            dest.edit = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dogRequest:NSFetchRequest<Dog> = Dog.fetchRequest()
        do { doggies = try context.fetch(dogRequest) }
        catch { print(error) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doggies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCell", for: indexPath) as! DogCell
        if doggies[indexPath.row].name == nil || doggies[indexPath.row].name == "" {
            collection.dogNameLabel.setTitle("No Name", for: .normal)
        }
        else {
            collection.dogNameLabel.setTitle(doggies[indexPath.row].name, for: .normal)
        }
        if let img = doggies[indexPath.row].image {
            collection.backgroundView = UIImageView(image: UIImage(data: img as Data, scale:1.0))
            collection.dogNameLabel.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            collection.backgroundView = nil
            collection.dogNameLabel.setTitleColor(UIColor.black, for: .normal)
        }
        collection.primaryKey = indexPath.row
        collection.editDelegate = self
        return collection
    }
}
