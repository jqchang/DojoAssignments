//
//  AddItemTableViewControllerDelegate.swift
//  bucketList
//
//  Created by Justin Chang on 3/14/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text:String, at indexPath:IndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
