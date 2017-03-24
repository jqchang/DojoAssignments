//
//  SubmitDelegate.swift
//  madlibs
//
//  Created by Justin Chang on 3/20/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

protocol SubmitDelegate: class {
    func submitButtonWasPressed(controller: UIViewController, wordBank:[String])
}
