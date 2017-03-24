//
//  DogImagePicker.swift
//  mydogs
//
//  Created by Justin Chang on 3/23/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class DogImagePicker:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imageDelegate:ImageDelegate?
    let myImageView = UIImageView()
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func unwindToAdd() {
        performSegue(withIdentifier: "unwindToAdd", sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        myImageView.contentMode = .scaleAspectFit //3
        myImageView.image = chosenImage //4
        dismiss(animated:true, completion: unwindToAdd) //5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! AddDogViewController
        dest.imagePicked(image: myImageView.image)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: unwindToAdd)
    }
    
}
