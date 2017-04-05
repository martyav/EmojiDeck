//
//  ControlButton.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 4/5/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ControlButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 66))
        
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.gray, for: .disabled)
        self.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
