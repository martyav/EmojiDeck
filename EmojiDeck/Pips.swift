//
//  Pips.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/22/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class Pips: UIView {
    
    var topOneLabel: UILabel!
    var topTwoLabel: UILabel!
    var topThreeLabel: UILabel!
    
    var midOneLabel: UILabel!
    var midTwoLabel: UILabel!
    var midThreeLabel: UILabel!
    
    var bottomOneLabel: UILabel!
    var bottomTwoLabel: UILabel!
    var bottomThreeLabel: UILabel!
    
    var tenSpot: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        backgroundColor = .white
        
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        topOneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        topTwoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        topThreeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        midOneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        midTwoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        midThreeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        bottomOneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        bottomTwoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        bottomThreeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        tenSpot = UILabel(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        
        let labelArr = [
            topOneLabel,
            topTwoLabel,
            topThreeLabel,
            midOneLabel,
            midTwoLabel,
            midThreeLabel,
            bottomOneLabel,
            bottomTwoLabel,
            bottomThreeLabel,
            tenSpot
        ]
        
        for label in labelArr {
            addSubview(label!)
            label?.font = UIFont.boldSystemFont(ofSize: 20)
            label?.translatesAutoresizingMaskIntoConstraints = false
            label?.text = " "
        }
        
        let _ = [
            // top row
            // one
            topOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            topOneLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            // two
            topTwoLabel.leadingAnchor.constraint(equalTo: topOneLabel.leadingAnchor, constant: 2),
            topTwoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            // three
            topThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.leadingAnchor, constant: 2),
            topThreeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            // middle row
            // one
            midOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            midOneLabel.topAnchor.constraint(equalTo: topOneLabel.bottomAnchor, constant: 10),
            // two
            midTwoLabel.leadingAnchor.constraint(equalTo: midOneLabel.leadingAnchor, constant: 2),
            midTwoLabel.topAnchor.constraint(equalTo: topTwoLabel.bottomAnchor, constant: 10),
            // three
            midThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.leadingAnchor, constant: 2),
            midThreeLabel.topAnchor.constraint(equalTo: topThreeLabel.bottomAnchor, constant: 10),
            // bottom row
            // one
            bottomOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            bottomOneLabel.topAnchor.constraint(equalTo: midOneLabel.bottomAnchor, constant: 10),
            // two
            bottomTwoLabel.leadingAnchor.constraint(equalTo: midOneLabel.leadingAnchor, constant: 2),
            bottomTwoLabel.topAnchor.constraint(equalTo: midTwoLabel.bottomAnchor, constant: 10),
            // three
            bottomThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.leadingAnchor, constant: 2),
            bottomThreeLabel.topAnchor.constraint(equalTo: midThreeLabel.bottomAnchor, constant: 10),
            // tenSpot
            tenSpot.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tenSpot.topAnchor.constraint(equalTo: bottomThreeLabel.bottomAnchor)
            ].map{ $0.isActive = true }

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func fillWith(_ emoji: Suit, _ number: Number) {
        switch number {
        case .one:
            midTwoLabel?.text = emoji.symbol()
        case .two:
            topOneLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .three:
            topTwoLabel?.text = emoji.symbol()
            midTwoLabel?.text = emoji.symbol()
            bottomTwoLabel?.text = emoji.symbol()
        case .four:
            topOneLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .five:
            topOneLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midTwoLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .six:
            topOneLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midOneLabel?.text = emoji.symbol()
            midThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .seven:
            topOneLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midOneLabel?.text = emoji.symbol()
            midThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
            tenSpot?.text = emoji.symbol()
        case .eight:
            topOneLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midOneLabel?.text = emoji.symbol()
            midTwoLabel?.text = emoji.symbol()
            midThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomTwoLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .nine:
            topOneLabel?.text = emoji.symbol()
            topTwoLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midOneLabel?.text = emoji.symbol()
            midTwoLabel?.text = emoji.symbol()
            midThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomTwoLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
        case .ten:
            topOneLabel?.text = emoji.symbol()
            topTwoLabel?.text = emoji.symbol()
            topThreeLabel?.text = emoji.symbol()
            midOneLabel?.text = emoji.symbol()
            midTwoLabel?.text = emoji.symbol()
            midThreeLabel?.text = emoji.symbol()
            bottomOneLabel?.text = emoji.symbol()
            bottomTwoLabel?.text = emoji.symbol()
            bottomThreeLabel?.text = emoji.symbol()
            tenSpot?.text = emoji.symbol()
        }
    }
}
