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
        
        layoutSubviews()
        
        numberAndSuitLabel?.text = ""
        
        self.addSubview(numberAndSuitLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        numberAndSuitLabel = UILabel()
        
        numberAndSuitLabel.frame = CGRect(x: 8, y: 8, width: 200, height: 20)
    }

}
