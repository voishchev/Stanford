//
//  ViewController.swift
//  Concentration
//
//  Created by Sergei Voishchev on 25/05/2022.
//  Copyright © 2022 Sergei Voishchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for UIControlState)
        }
    }
}

