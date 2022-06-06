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
    private(set)  var cards = [Card]  ()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                         return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
//        checks, similar to guard
//        but in case of guard the code will not crash
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
            } else {
//                0 or 2 cards are faceUp
//                for flipDownIndex  in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                } 
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
     
    init (numbersOfPairsOfCards: Int)  {
        assert(numbersOfPairsOfCards>0, "Concentration.init(numbersOfPairsOfCards : \(numbersOfPairsOfCards)")
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
 
 
