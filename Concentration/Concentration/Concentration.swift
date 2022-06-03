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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
//                0 or 2 cards are faceUp
                for flipDownIndex  in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
     
    init (numbersOfPairsOfCards: Int)  {
        for _ in 0..<numbersOfPairsOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
        }
//         
//        let setOfCards = Set<Card>(cards)
//        cards = Array<Card>(setOfCards)
    }
}
 
 
