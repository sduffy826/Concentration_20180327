//
//  ViewController.swift
//  Concentration_20180326
//
//  Created by Sean Duffy on 3/26/18.
//  Copyright © 2018 Sean Duffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip count: \(flipCount)"
        }
    }
    
    // The valid emoji's
    var emojiChoices = ["😀","😁","😆","😅","🤣","☺️","😊","😉","🤪","🧐","😜","😳","😱","🤔","🙄"]
    
    // Has dictionary of card identifier and it's emoji
    var emoji = [Int: String]()
 
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func cardPushed(_ sender: UIButton) {
        flipCount += 1
        // Get card
        if let cardIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        } else {
            print("Card not found")
        }
        print("cardPushed")
    }
    
    // This updates the cards on the screen based on their current state
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
              button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    // Returns the emoji for a given card identifier, if it's the first time we're looking at
    // a card then it'll set it's emoji
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
          // Get random emoji to use
          let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
    
          // Put it in dictionary
          emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

