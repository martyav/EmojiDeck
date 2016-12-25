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
        
        //layer.borderWidth = 5
        //layer.cornerRadius = 15
        
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
            // top row
            topOneLabel,
            topTwoLabel,
            topThreeLabel,
            //middle row
            midOneLabel,
            midTwoLabel,
            midThreeLabel,
            // bottom row
            bottomOneLabel,
            bottomTwoLabel,
            bottomThreeLabel,
            // ten
            tenSpot
        ]
        
        for label in labelArr {
            addSubview(label!)
            label?.font = UIFont.boldSystemFont(ofSize: 40)
            label?.translatesAutoresizingMaskIntoConstraints = false
            label?.isHidden = true
        }
        
        let _ = [
            // ** top row
            // one
            topOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            topOneLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            // two
            topTwoLabel.leadingAnchor.constraint(equalTo: topOneLabel.trailingAnchor, constant: 2),
            topTwoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            // three
            topThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.trailingAnchor, constant: 2),
            topThreeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            // ** middle row
            // one
            midOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            midOneLabel.topAnchor.constraint(equalTo: topOneLabel.bottomAnchor, constant: 10),
            // two
            midTwoLabel.leadingAnchor.constraint(equalTo: midOneLabel.trailingAnchor, constant: 2),
            midTwoLabel.topAnchor.constraint(equalTo: topTwoLabel.bottomAnchor, constant: 10),
            // three
            midThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.trailingAnchor, constant: 2),
            midThreeLabel.topAnchor.constraint(equalTo: topThreeLabel.bottomAnchor, constant: 10),
            // ** bottom row
            // one
            bottomOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            bottomOneLabel.topAnchor.constraint(equalTo: midOneLabel.bottomAnchor, constant: 10),
            // two
            bottomTwoLabel.leadingAnchor.constraint(equalTo: midOneLabel.trailingAnchor, constant: 2),
            bottomTwoLabel.topAnchor.constraint(equalTo: midTwoLabel.bottomAnchor, constant: 10),
            // three
            bottomThreeLabel.leadingAnchor.constraint(equalTo: topTwoLabel.trailingAnchor, constant: 2),
            bottomThreeLabel.topAnchor.constraint(equalTo: midThreeLabel.bottomAnchor, constant: 10),
            // ** tenSpot
            tenSpot.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tenSpot.topAnchor.constraint(equalTo: bottomThreeLabel.bottomAnchor)
            ].map{ $0.isActive = true }

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func fillWith(_ emoji: Suit, _ number: Number) {
        
        let emojiArray = [
            // top
            topOneLabel,
            topTwoLabel,
            topThreeLabel,
            // middle
            midOneLabel,
            midTwoLabel,
            midThreeLabel,
            // bottom
            bottomOneLabel,
            bottomTwoLabel,
            bottomThreeLabel,
            tenSpot
        ]
        
        for label in emojiArray {
            label?.text = emoji.symbol()
        }
        
        //layer.borderColor = emoji.color().cgColor
        
        switch number {
        case .one:
            midTwoLabel?.isHidden = false
        case .two:
            topOneLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .three:
            topTwoLabel?.isHidden = false
            midTwoLabel?.isHidden = false
            bottomTwoLabel?.isHidden = false
        case .four:
            topOneLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .five:
            topOneLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midTwoLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .six:
            topOneLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midOneLabel?.isHidden = false
            midThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .seven:
            topOneLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midOneLabel?.isHidden = false
            midTwoLabel?.isHidden = false
            midThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .eight:
            topOneLabel?.isHidden = false
            topTwoLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midOneLabel?.isHidden = false
            midThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomTwoLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .nine:
            topOneLabel?.isHidden = false
            topTwoLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midOneLabel?.isHidden = false
            midTwoLabel?.isHidden = false
            midThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomTwoLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
        case .ten:
            topOneLabel?.isHidden = false
            topTwoLabel?.isHidden = false
            topThreeLabel?.isHidden = false
            midOneLabel?.isHidden = false
            midTwoLabel?.isHidden = false
            midThreeLabel?.isHidden = false
            bottomOneLabel?.isHidden = false
            bottomTwoLabel?.isHidden = false
            bottomThreeLabel?.isHidden = false
            tenSpot?.isHidden = false
        }
    }
}
