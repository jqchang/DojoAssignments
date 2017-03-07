//: Playground - noun: a place where people can play

import UIKit

func tossCoin() -> String {
    print("Tossing a Coin!")
    let raw:Int = Int(arc4random_uniform(2))
    var result:String;
    if raw == 0 {
        result = "Heads"
    }
    else {
        result = "Tails"
    }
    print(result)
    return result
}

func tossMultipleCoins(times: Int) -> Double {
    var heads:Int = 0;
    var tails:Int = 0;
    for _ in 1...times {
        if (tossCoin() == "Heads") {
            heads += 1
        }
        else {
            tails += 1
        }
    }
    return Double(heads)/Double(tails)
}

print("Tossing 100 coins - ratio = \(tossMultipleCoins(times:100))")