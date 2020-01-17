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
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
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
        }
    }
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    //MARK: - LifeCircle
    func updateViewFromModel​ () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji, for: .normal)
                button.backgroundColor = .
            }
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flip card (withEmoji \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    override func viewDidLoad() {
    }
}

