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
    init(numberOfPairsOfCards: Int) {
        for _ in 1..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
            // перетасовать карты
        }
    }
    
    //MARK: - LifeCyrcle
    func chooseCard(at index: Int) {
        
    }
    
}
