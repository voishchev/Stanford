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
    lazy var game = Concentration(numbersOfPairsOfCards: cardButtons.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
//   outlet collection
    @IBOutlet var cardButtons: [UIButton]!
//   emojiChoices
//    var emojiChoices = ["👻", "🎃", "👻", "🎃"]
//   outlet
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
//       conditional
//       instead of '!'
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel
        } else {
            print("Chosen card is not in a [cardButtons]")
        }
//       old implementation, before merging touch*Card funcs
//        flipCard(withEmoji: "👻", on: sender)
    }
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🎃", "👻", "🤢", "🦺", "🦵", "🥑", "🦾"]
    func emoji(for card: Card) -> String {
        return("?")
    }
 }
