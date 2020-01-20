//
//  Concentration.swift
//  Concentration
//
//  Created by Алексей Смоляк on 1/17/20.
//  Copyright © 2020 Алексей Смоляк. All rights reserved.
//

import Foundation

class Concentration {
    //MARK: - Properties
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shaffle()
    }
    
    //MARK: - LifeCyrcle
    func resetGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shaffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let mathIndex = indexOfOneAndOnlyFaceUpCard, mathIndex != index {
                if cards[mathIndex].identifier == cards[index].identifier {
                    cards[mathIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
}

extension Array {
    mutating func shaffle() {
        if count < 2 { return }
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: diff.arc4random)
            swapAt(i, j)
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
