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
    
    //MARK: - Outlets
    @IBOutlet private weak var flipCountLable: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    //MARK: - Actions
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel​()
        } else {
            print("shoosen cards was not in cardButtons")
        }
    }
    
    //MARK: - Properties
    private (set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    //    private var emojiChoices = ["🎃", "🚂", "🚙", "✈️", "❤️", "💕", "😍", "😘", "💀", "🤖", "👾", "🦾", "🧠", "👁", "👀", "👤"]
    private var emojiChoices = "🎃🚂🚙✈️❤️💕😍😘💀🤖👾🦾🧠👁👀👤"
    private var emoji = [Int: String]()
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1)/2
    }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    
    
    //MARK: - LifeCircle
    override func viewDidLoad() {
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLable.attributedText = attributedString
    }
    
    private func updateViewFromModel​ () {
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
    
    private func emoji(for card: Card) -> String {
        if  emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card.identifier] = String(emojiChoices.remove(at: randomStringIndex))
            //let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
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
