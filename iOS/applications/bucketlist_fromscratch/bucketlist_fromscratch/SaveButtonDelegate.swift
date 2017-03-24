//
//  SaveButtonDelegate.swift
//  bucketlist_fromscratch
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

protocol SaveButtonDelegate: class {
    func saveButtonWasPressed(controller: UIViewController, text: String, editing: Int)
}
