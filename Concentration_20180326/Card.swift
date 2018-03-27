//
//  Card.swift
//  Concentration_20180326
//
//  Created by Sean Duffy on 3/26/18.
//  Copyright © 2018 Sean Duffy. All rights reserved.
//

import Foundation

struct Card
{
    static var identifierFactory = 0
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    // Bump up static identifier count and return it
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}

