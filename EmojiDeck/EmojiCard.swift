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
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 2
        layer.borderColor = suit.color().cgColor
        
        backgroundColor = .white
        
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        heightAnchor.constraint(equalToConstant: 350).isActive = true
        
//        addSubview(topNumberLabel)
//        addSubview(bottomNumberLabel)
//        addSubview(topSuitLabel)
//        addSubview(bottomSuitLabel)
//        
//        let _ = [
//            topNumberLabel,
//            topSuitLabel,
//            bottomNumberLabel,
//            bottomSuitLabel
//            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        topNumberLabel?.text = num.cornerLabel()
        bottomNumberLabel?.text = num.cornerLabel()
        topSuitLabel?.text = suit.symbol()
        bottomNumberLabel?.text = suit.symbol()
        
        topSuitLabel?.textColor = suit.color()
        topNumberLabel?.textColor = suit.color()
        bottomSuitLabel?.textColor = suit.color()
        bottomNumberLabel?.textColor = suit.color()
        
        // this bit turns the suit & num upside down -- the units are in radians
        bottomNumberLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        bottomSuitLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
    }
    
 }
