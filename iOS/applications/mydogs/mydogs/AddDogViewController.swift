//
//  AddDogViewController.swift
//  mydogs
//
//  Created by Justin Chang on 3/21/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImageDelegate {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var addDelegate:AddDelegate?
    var name:String?
    var color:String?
    var food:String?
    var image:UIImage?
    var targetIndex:Int?
    var midButtonString:String?
    var edit:Bool?

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var colorLabel: UITextField!
    @IBOutlet weak var mealLabel: UITextField!
    @IBOutlet weak var addButtonLabel: UIButton!
    @IBOutlet weak var topRightButtonLabel: UIBarButtonItem!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addDogPressed(_ sender: Any) {
        print("Add button pressed in view controller")
        var puppy:Dog?
        if let editStatus = edit {
            print("Edit exists")
            if editStatus {
                print("Deleting")
                print((addDelegate as! DogCollectionViewController).doggies[targetIndex!])
                puppy = (addDelegate as! DogCollectionViewController).doggies[targetIndex!]
                context.delete(puppy!)
            }
            else {
                print("Adding")
                puppy = Dog(context: context)
                puppy!.name = nameLabel.text
                puppy!.color = colorLabel.text
                puppy!.food = mealLabel.text
                if (myImageView.image != nil) {
                    print(myImageView.image)
                    puppy!.image = UIImagePNGRepresentation(myImageView.image!) as! NSData
                }
            }
        }
        else {
            print("edit not found")
        }
        do { try context.save() }
        catch { print(error) }
        (addDelegate as! DogCollectionViewController).doggies.append(puppy!)
        addDelegate?.addButtonPressed()
        
        dismiss(animated: true, completion: nil)
        // sender issue?
    }
    
    @IBAction func topRightButtonPressed(_ sender: Any) {
        print("Top right button pressed.")
        print("Editing")
        var puppy:Dog?
        print((addDelegate as! DogCollectionViewController).doggies[targetIndex!])
        puppy = (addDelegate as! DogCollectionViewController).doggies[targetIndex!]
        puppy!.name = nameLabel.text
        puppy!.color = colorLabel.text
        puppy!.food = mealLabel.text
        if (myImageView.image != nil) {
            print(myImageView.image)
            puppy!.image = UIImagePNGRepresentation(myImageView.image!) as! NSData
        }
        do { try context.save() }
        catch { print(error) }
        (addDelegate as! DogCollectionViewController).doggies.append(puppy!)
        addDelegate?.addButtonPressed()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePicked(image: UIImage?) {
        self.image = image
        myImageView.image = image
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DogImagePicker
        dest.imageDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if name != nil {
            nameLabel.text = name
        }
        if color != nil {
            colorLabel.text = color
        }
        if food != nil {
            mealLabel.text = food
        }
        if image != nil {
            myImageView.image = image
        }
        if edit! {
            addButtonLabel.setTitle("Delete Dog", for: .normal)
            addButtonLabel.backgroundColor = UIColor.red
            addButtonLabel.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            addButtonLabel.setTitle("Add Dog", for: .normal)
            topRightButtonLabel.isEnabled = false
            topRightButtonLabel.title = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
