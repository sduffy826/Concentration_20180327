//
//  File.swift
//  Concentration_20180326
//
//  Created by Sean Duffy on 3/26/18.
//  Copyright © 2018 Sean Duffy. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()  // Holds the cards for game
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                // Turn all cards down and make card selected up
                for cardIndex in cards.indices {
                    cards[cardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // Shuffle the cards in the array
    func shuffleCards() {
        var lastCard = cards.count - 1
        while (lastCard > 0) {
            let randomCard = Int(arc4random_uniform(UInt32(lastCard)))
            cards.swapAt(lastCard, randomCard)
            lastCard -= 1
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]  // remember card is a struct so when appending it creates copies of card, which are value copies so they're
                                   // different objects (this is appending an array onto an existing array)
        }
        shuffleCards()        
    }
}
