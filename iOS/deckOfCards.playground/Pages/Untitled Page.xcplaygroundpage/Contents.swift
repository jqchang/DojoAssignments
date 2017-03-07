//: Playground - noun: a place where people can play

import UIKit

struct Card {
    let value:String;
    let Suit:String;
    let numerical_value:Int;
}

class Deck {
    var cards:[Card];
    init() {
        self.cards = [Card]();
        for suit in ["Clubs","Spades","Hearts","Diamonds"] {
            for num in 1...13 {
                if num == 1 {
                    cards.append(Card(value:"A", Suit:suit, numerical_value:num));
                }
                else if num == 11 {
                    cards.append(Card(value:"J", Suit:suit, numerical_value:num));
                }
                else if num == 12 {
                    cards.append(Card(value:"K", Suit:suit, numerical_value:num));
                }
                else if num == 13 {
                    cards.append(Card(value:"Q", Suit:suit, numerical_value:num));
                }
                else {
                    cards.append(Card(value:String(num), Suit:suit, numerical_value:num));
                }
            }
        }
        self.shuffle()
    }
    func reset() {
        self.cards = [Card]();
        for suit in ["Clubs","Spades","Hearts","Diamonds"] {
            for num in 1...13 {
                if num == 1 {
                    cards.append(Card(value:"A", Suit:suit, numerical_value:num));
                }
                else if num == 11 {
                    cards.append(Card(value:"J", Suit:suit, numerical_value:num));
                }
                else if num == 12 {
                    cards.append(Card(value:"K", Suit:suit, numerical_value:num));
                }
                else if num == 13 {
                    cards.append(Card(value:"Q", Suit:suit, numerical_value:num));
                }
                else {
                    cards.append(Card(value:String(num), Suit:suit, numerical_value:num));
                }
            }
        }
        self.shuffle()
    }
    func shuffle() {
        for _ in 0..<self.cards.count {
            let card1:Int = Int(arc4random_uniform(UInt32(self.cards.count)))
            let card2:Int = Int(arc4random_uniform(UInt32(self.cards.count)))
            let temp:Card = self.cards[card1]
            self.cards[card1] = self.cards[card2]
            self.cards[card2] = temp
        }
    }
    func deal() -> Card {
        return cards.remove(at: 0)
    }
}

class Player {
    var name:String;
    var hand:[Card];
    init(name:String) {
        self.name = name;
        self.hand = [Card]()
    }
    func draw(source: inout Deck, cards:Int=1) {
        for _ in 1...cards {
            self.hand.append(source.deal())
        }
    }
    func discard(target: Card) -> Bool {
        for i in 0..<self.hand.count {
            if self.hand[i].numerical_value == target.numerical_value && self.hand[i].Suit == target.Suit {
                self.hand.remove(at:i)
                return true;
            }
        }
        return false
    }
}

var j = Player(name:"Justin")
var deck = Deck()
j.draw(source:&deck, cards:5)
for card in j.hand {
    print("\(card.value) of \(card.Suit)")
}
