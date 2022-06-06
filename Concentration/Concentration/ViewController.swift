//
//  ViewController.swift
//  Concentration
//
//  Created by Sergei Voishchev on 25/05/2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    interaction btw C and M
    private lazy var game = Concentration(numbersOfPairsOfCards: numbersOfPairsOfCards)
//    private because numbersOfPairsOfCards is tight with the UI
    var numbersOfPairsOfCards: Int {
        return cardButtons.count / 2
    }
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
//    outlets are almost always private
//   outlet collection
    @IBOutlet private var cardButtons: [UIButton]!
//   outlet
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private  func touchCard(_ sender: UIButton) {
        flipCount += 1
//       conditional
//       instead of '!'
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card is not in a [cardButtons]")
        }
//       old implementation, before merging touch*Card funcs
//        flipCard(withEmoji: "👻", on: sender)
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    private var emojiChoices = ["🎃", "👻", "🤢", "🦺", "🦵", "🥑", "🦾"]
    private var emoji = [Int: String]()
    private  func getEmoji(for card: Card) -> String {
        if emoji[card.id] == nil {
            if emojiChoices.count > 0 {
    //            remove(at: ) not only removes, but also returnes that removing value
                emoji[card.id] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        }
//        if nil then return '? '
        return emoji[card.id] ?? "?"
    }
 }

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0 
        }
    }
}
