//: Playground - noun: a place where people can play

import UIKit

var myArr: [Int] = [Int]()
for i in 1...255 {
    myArr.append(i)
}

print("Shuffle!")
for i in 1...100 {
    var target1:Int = Int(arc4random_uniform(255))
    var target2:Int = Int(arc4random_uniform(255))

    var temp = myArr[target1]
    myArr[target1] = myArr[target2]
    myArr[target2] = temp
}

var answer:Int
for i in 0..<myArr.count {
    if myArr[i] == 42 {
        answer = myArr.remove(at: i)
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
        break
    }
}