//
//  Card.swift
//  Concentration
//
//  Created by Sergei Voishchev on 02.06.2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
//    Let's satisfy Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    var isFaceUp =  false
    var isMatched = false
    private var id: Int
//    NO emoji
//    because Model is UI independent
//    you can change the appearance of cards
//    but it should not influence on logic
    
//    utility methods and vars for Card 
    private static var identifierFactor = 0
    private static func getAUniqIdentifier() -> Int  {
        identifierFactor += 1
        return identifierFactor
    }
    init() {
//        self. is for distinguishing IDs: one - as our self variable
//        and annother one - as a parameter of initializer
        self.id = Card.getAUniqIdentifier()
    }
}
