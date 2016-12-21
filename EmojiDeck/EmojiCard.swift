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
    
    let suit: Suit = .Ppl
    let num: Number = .one
    
    override init(frame: CGRect) {
 
        super.init(frame: frame)
        
        self.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 2
        self.layer.borderColor = self.suit.color().cgColor
        
        // this bit turns the suit & num upside down -- the units are in radians
        bottomNumberLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        bottomSuitLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
    }
    
    
    
 }
