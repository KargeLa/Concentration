//
//  ViewController.swift
//  Concentration
//
//  Created by Алексей Смоляк on 1/10/20.
//  Copyright © 2020 Алексей Смоляк. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //MARK: - Properties
    var flipCount = 0 {
        didSet {
            flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["🎃", "🚂", "🚙", "✈️", "❤️", "💕", "😍", "😘", "💀", "🤖", "👾", "🦾", "🧠", "👁", "👀", "👤"]
    var emoji = [Int: String]()
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    //MARK: - Outlets
    @IBOutlet weak var flipCountLable: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    //MARK: - Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel​()
        } else {
            print("shoosen cards was not in cardButtons")
        }
    }
    
    //MARK: - LifeCircle
    override func viewDidLoad() {
    }
    
    func updateViewFromModel​ () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if  emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        } else {
        //            return "?"
        //        }
        // эквивалентный код
        return emoji[card.identifier] ?? "?"
    }
}

