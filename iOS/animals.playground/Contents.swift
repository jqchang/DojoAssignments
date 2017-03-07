//: Playground - noun: a place where people can play

import UIKit

class Animal {
    let name:String;
    var health:Int;
    init(name:String, health:Int=100) {
        self.name = name;
        self.health = health;
    }
    func displayHealth() {
        print("\(self.name) - \(self.health) health")
    }
}

class Cat:Animal {
    override init(name:String, health:Int=150) {
        super.init(name:name, health:health)
    }
    func growl() {
        print("Rawr!")
    }
    func run() {
        if health > 10 {
            print("Running!")
            self.health -= 10;
        }
        else {
            print("Not enough remaining health.")
        }
    }
}

class Cheetah:Cat {
    init(name:String) {
        super.init(name:name, health:200)
    }
    override func run() {
        print("Running Fast")
        self.health -= 50;
    }
    func sleep() {
        self.health += 50;
        if self.health > 200 {
            self.health = 200
        }
    }
}

class Lion:Cat {
    init(name:String) {
        super.init(name:name, health:200)
    }
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }
}

func provoke(target:Cat) {
    target.growl()
}

var chester:Cheetah = Cheetah(name:"Chester")
for _ in 1...4 {
    chester.run()
}
chester.displayHealth()

var simba:Lion = Lion(name:"Simba")
for _ in 1...3 {
    simba.run()
}
simba.growl()