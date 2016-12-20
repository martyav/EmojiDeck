//
//  EmojiCard.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

protocol PlayingCard {
    var suit: Suit { get }
    var num: Number { get }
}

class EmojiCard: UIView, PlayingCard {
    var topNumberLabel: UILabel!
    var topSuitLabel: UILabel!
    var bottomNumberLabel: UILabel!
    var bottomSuitLabel: UILabel!
    var middleImage: UIImage!
    
    let suit: Suit
    let num: Number
    
    init(frame: CGRect, suit:Suit, num: Number) {
        self.suit = suit
        self.num = num
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        // this bit turns the suit & num upside down -- the units are in radians
        bottomNumberLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        bottomSuitLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
    }
}
