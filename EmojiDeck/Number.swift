//
//  Number.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Numbers: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    
    func cornerLabel() -> String {
        return String(self.rawValue)
    }
    
    // each inner array corresponds to a row inside an imaginary box
    // the idea is that when we create the card, the strings in the inner arrays are += to with the correct emoji
    // then they are positioned by placing the proper inner array in the proper label
    // the labels will be arranged like so: 
    // [
    //  [...]
    //  [...]
    //  [...]
    //   [.]
    // ]
    
    func symbols() -> [[String]] {
        switch self {
        case .one:
            return [[""]]
        case .two:
            return [[""],[""]]
        case .three:
            return [["",""],[""]]
        case .four:
            return [["",""],["",""]]
        case .five:
            return [["",""],[""],["",""]]
        case .six:
            return [["",""],["",""],["",""]]
        case .seven:
            return [["",""],["","",""],["",""]]
        case .eight:
            return [["",""],["","",""],["",""],[""]]
        case .nine:
            return [["","",""],["","",""],["","",""]]
        case .ten:
            return [["","",""],["","",""],["","",""],[""]]
        }
    }
}
