//
//  CreateItemViewController.swift
//  todolist
//
//  Created by Justin Chang on 3/21/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

class CreateItemViewController: UIViewController {
    var addDelegate:AddDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    @IBAction func addItemButtonPressed(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newTask = Task(context: context)
        newTask.title = titleTextField.text
        newTask.desc = descriptionTextField.text
        newTask.date = dateField.date as NSDate?
        newTask.done = false
        do {
            print(newTask)
            try context.save()
        } catch {
            print("Error creating new task")
        }
        addDelegate?.addButtonPressed()
    }
}
