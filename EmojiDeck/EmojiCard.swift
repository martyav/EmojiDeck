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
    var suit: Suit = .Ppl
    var num: Number = .ten
    var canBeDrawn: Bool = true
    
    /*
     NOTE
     
     cardDeck is always either 40 items long, or completely empty.
     We track cards by looking at the cardDeck & seeing which cards are active, by calling currentSizeOfDeck.
     The discardPile is for displaying cards in the tableview. 
     Calling .count on our arrays and nav stack proved very buggy, with many index out of range errors.
     A computed variable has proven much more accurate and stable.
    */
    
    static var cardDeck: [EmojiCard] = []
    static var discardPile: [EmojiCard] = []
    static var currentSizeOfDeck: Int {
        get {
            var currentlyactiveCards = 0
            
            for card in EmojiCard.cardDeck where card.canBeDrawn {
                currentlyactiveCards += 1
            }
            return currentlyactiveCards
        }
    }
    
    var topNumberLabel: UILabel!
    var topSuitLabel: UILabel!
    var middleImage: Pips!
    var bottomNumberLabel: UILabel!
    var bottomSuitLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("you shouldn't be running this if you're doing it programatically")
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        backgroundColor = .white
        
        layer.borderWidth = 2
        layer.cornerRadius = 10
        layer.borderColor = UIColor.black.cgColor
        
        topNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        topSuitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        middleImage = Pips(frame: CGRect(x: 0, y: 0, width: 150, height: 250))
        bottomNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        bottomSuitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        topNumberLabel?.text = num.cornerLabel()
        topNumberLabel.font = UIFont(name: "Superclarendon-Black", size: 40)
        topNumberLabel?.textColor = suit.color()
        topSuitLabel.font = UIFont.boldSystemFont(ofSize: 20)
        topSuitLabel?.text = suit.symbol()
        topSuitLabel?.textColor = suit.color()
        
        bottomNumberLabel?.text = num.cornerLabel()
        bottomNumberLabel.font = UIFont(name: "Superclarendon-Black", size: 40)
        bottomNumberLabel?.textColor = suit.color()
        bottomSuitLabel?.text = suit.symbol()
        bottomSuitLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bottomSuitLabel?.textColor = suit.color()
        
        // this bit turns the suit & num upside down -- the units are in radians
        bottomNumberLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        bottomSuitLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
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
        
        _ = [
            topNumberLabel,
            topSuitLabel,
            middleImage,
            bottomNumberLabel,
            bottomSuitLabel
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        _ = [
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
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 1
    
    }
    
    func tilt() {
        let leftOrRight: Double
        let randomTwist: Double
        let angle: Double
        
        if EmojiCard.currentSizeOfDeck % 2 == 0 {
            leftOrRight = -1.0
        } else {
            leftOrRight = 1.0
        }
        
        randomTwist = Double(arc4random_uniform(20))
        angle = (randomTwist/100) * leftOrRight
        self.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }
    
}

/*
 NOTE
 
 The below function is a work-around for our inits & our protocol not getting along.
 Our init does not want any other parameters than the one it already has.
 But our playingCard protocol must have a suit and a num fed in, or we can't make cards at all.
 A new init, with suit & num parameters, would need to have a frame argument fed in to satisfy its super. Ugh.
 So...
 We give our cards dummy values in suit and num when we initialize them, to satisfy our protocol.
 Then we individualize the cards when we call this function, so we don't have to mess around with any more inits.
 */


func makeNewCard(suit: Suit, num: Number) -> EmojiCard {
    
    let newCard = EmojiCard()
    
    newCard.suit = suit
    newCard.num = num
    
    print(newCard.num.cornerLabel(), newCard.suit.symbol())
    
    return newCard
}

func createFreshDeck() {
    
    for possibleSuit in 0...3 {
        for possibleNumber in 1...10 {
            let newSuit = Suit(rawValue: possibleSuit)
            let newNum = Number(rawValue: possibleNumber)
            let newCard = makeNewCard(suit: newSuit!, num: newNum!)
            
            EmojiCard.cardDeck.append(newCard)
        }
    }
}

func drawACard() -> EmojiCard {
    
    let randomIndex = Int(arc4random_uniform(UInt32(EmojiCard.cardDeck.count)))
    let newCard = EmojiCard.cardDeck[randomIndex]
    
    if newCard.canBeDrawn {
        newCard.canBeDrawn = false
        EmojiCard.discardPile.append(newCard)
        return newCard
    } else {
        return drawACard()
    }
}
