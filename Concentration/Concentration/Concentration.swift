 //
//  Concentration.swift
//  Concentration
//
//  Created by Sergei Voishchev on 02.06.2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import Foundation

class Concentration {
//    my public API for Concentration game
    var cards = [Card]  ()
    
    func chooseCard(at index: Int) {
        
    }
    
    init (numbersOfPairsOfCards: Int)  {
        for _ in 0..<numbersOfPairsOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
        }
//        ToDo:  shuffle the cards
    }
}
 
 
