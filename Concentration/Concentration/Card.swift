//
//  Card.swift
//  Concentration
//
//  Created by Sergei Voishchev on 02.06.2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
//    NO emoji
//    because Model is UI independent
//    you can change the appearance of cards
//    but it sh ould not influence to logic
    
//    utility methods and vars for Card 
    static var identifierFactory = 0
    static func getAUniqIdentifier() -> Int  {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
//        self. is for distinguishing IDs: one - as our self variable
//        and annother one - as a parameter of initializer
        self.id = Card.getAUniqIdentifier()
    }
}
