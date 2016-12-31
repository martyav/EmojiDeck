//
//  CardTableViewCell.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/24/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    var numberAndSuitLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        numberAndSuitLabel = UILabel()
        self.addSubview(numberAndSuitLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("you shouldn't be running this if you're doing it programatically")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        numberAndSuitLabel.frame = CGRect(x: 8, y: -4, width: 200, height: 50)
    }
}
