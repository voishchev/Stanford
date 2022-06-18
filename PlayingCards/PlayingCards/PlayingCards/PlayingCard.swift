//
//  PlayingCard.swift
//  PlayingCards
//
//  Created by Sergei Voishchev on 13.06.2022.
//
 
import Foundation

struct PlayingCard: CustomStringConvertible  {
    var description: String {
        return("\(rank) \(suit)")
    }
    
    var suit: Suit
    var rank: Rank

//    raw value
//    some king of assocoated values
    enum Suit: String, CustomStringConvertible {
        var description: String {return rawValue}
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs ]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return String("A")
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J":  return 11
            case .face(let kind) where kind == "Q":  return 12
            case .face(let kind) where kind == "K":  return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks: [Rank] = [.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), face("Q"),  face("K ") ]
            return allRanks
        }
    }
    
}
