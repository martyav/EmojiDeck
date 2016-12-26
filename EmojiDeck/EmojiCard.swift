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
    var middleImage: Pips!
    var bottomNumberLabel: UILabel!
    var bottomSuitLabel: UILabel!
    
    var suit: Suit = .Ppl
    var num: Number = .ten
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    static var cardDeck: [EmojiCard] = []
    static var discardPile: [EmojiCard] = []
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 2
        layer.cornerRadius = 10
        
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .white
        
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        topNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        topSuitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        middleImage = Pips(frame: CGRect(x: 0, y: 0, width: 150, height: 250))
        
        bottomNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        bottomSuitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        topNumberLabel.font = UIFont(name: "Superclarendon-Black", size: 40)
        topSuitLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        bottomNumberLabel.font = UIFont(name: "Superclarendon-Black", size: 40)
        bottomSuitLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        addSubview(topNumberLabel)
        addSubview(topSuitLabel)
        
        addSubview(middleImage)
        
        addSubview(bottomNumberLabel)
        addSubview(bottomSuitLabel)
        
        let _ = [
            topNumberLabel,
            topSuitLabel,
            bottomNumberLabel,
            bottomSuitLabel,
            middleImage
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        topNumberLabel?.text = num.cornerLabel()
        topSuitLabel?.text = suit.symbol()
        
        bottomNumberLabel?.text = num.cornerLabel()
        bottomSuitLabel?.text = suit.symbol()
        
        topNumberLabel?.textColor = suit.color()
        topSuitLabel?.textColor = suit.color()
        
        bottomNumberLabel?.textColor = suit.color()
        bottomSuitLabel?.textColor = suit.color()
        
        // this bit turns the suit & num upside down -- the units are in radians
        bottomNumberLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        bottomSuitLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
        let _ = [
            topNumberLabel,
            topSuitLabel,
            middleImage,
            bottomNumberLabel,
            bottomSuitLabel
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let _ = [
            // top num
            topNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            topNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            // top suit
            topSuitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            topSuitLabel.bottomAnchor.constraint(equalTo: topNumberLabel.bottomAnchor, constant: 28),
            // middle stuff
            middleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            middleImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            // bottom num
            bottomNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            bottomNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            // bottom suit
            bottomSuitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            bottomSuitLabel.bottomAnchor.constraint(equalTo: bottomNumberLabel.topAnchor, constant: -8)
            ].map{ $0.isActive = true }
        
        middleImage.fillWith(suit, num)
    }
    
    static func makeNewCard(suit: Suit, num: Number) -> EmojiCard {
        let newCard = EmojiCard()
        
        newCard.suit = suit
        newCard.num = num
        
        return newCard
    }
    
    static func randomize() -> EmojiCard {
        let suit = Suit(rawValue: Int(arc4random_uniform(4)))!
        let num = Number(rawValue: Int(arc4random_uniform(10) + 1))!
        
        let newCard = makeNewCard(suit: suit, num: num)
        
        return newCard
    }
    
    static func createFreshDeck() {
        for i in 0...3 {
            for j in 1...10 {
                let newSuit = Suit(rawValue: i)
                let newNum = Number(rawValue: j)
                let newCard = makeNewCard(suit: newSuit!, num: newNum!)
                EmojiCard.cardDeck.append(newCard)
            }
        }
    }
    
    static func drawACard() -> EmojiCard {
        let currentActiveCards = 40 - EmojiCard.discardPile.count
        
        let randomIndex = arc4random_uniform(UInt32(currentActiveCards))
        let newCard = EmojiCard.cardDeck[Int(randomIndex)]
        
        discardPile.append(newCard)
        cardDeck.remove(at: Int(randomIndex))
        
        return newCard
    }
    
 }
