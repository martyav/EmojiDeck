//
//  Suit.swift
//  SimpleCardViews
//
//  Created by Marty Avedon on 12/18/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

enum Suit: Int {
    case Cool
    case Cats
    case Poo
    case Eggplants
    
    func symbol() -> String {
        switch self {
        case .Cool:
            return "😎"
        case .Cats:
            return "😼"
        case .Eggplants:
            return "🍆"
        case .Poo:
            return "💩"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .Cool:
            return .black
        case .Cats:
            return UIColor(red:0.18, green:0.70, blue:0.29, alpha:1.0)
        case .Poo:
            return .orange
        case .Eggplants:
            return .purple
        }
    }
}
