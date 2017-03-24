//
//  Player.swift
//  persistData
//
//  Created by Justin Chang on 3/16/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import Foundation

class Player: NSObject, NSCoding {
    var name:String?
    
    override init() {
    }
    
    required init(coder aDecoder: NSCoder) {
        if let name = aDecoder.decodeObject(forKey: "name") as? String {
            self.name = name
        }
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
}
