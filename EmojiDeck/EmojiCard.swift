//
//  EmojiCard.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

protocol PlayingCard {
    var suit: Suit { get }
    var num: Number { get }
}

class EmojiCard: PlayingCard {
    let suit: Suit
    let num: Number
    
    init(suit:Suit, num: Number) {
        self.suit = suit
        self.num = num
    }
    
}
