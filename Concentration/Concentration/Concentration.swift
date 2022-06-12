 //
//  Concentration.swift
//  Concentration
//
//  Created by Sergei Voishchev on 02.06.2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import Foundation

struct Concentration {
//    my public API for Concentration game
    private(set)  var cards = [Card]  ()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter {cards[$0].isFaceUp}
            return faceUpCardIndices.count == 1 ? faceUpCardIndices[0] : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
       
    mutating func chooseCard(at index: Int) {
//        checks, similar to guard
//        but in case of guard the code will not crash
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
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
        assert(numbersOfPairsOfCards>0, "Concentration.init(numbersOfPairsOfCards  : \(numbersOfPairsOfCards)")
        for _ in 0..<numbersOfPairsOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card]
        }
//   Shuffle and duplicate cards
        cards = Array(Set(cards))
        cards.append(contentsOf: Set(cards))
    }
}
 
 
