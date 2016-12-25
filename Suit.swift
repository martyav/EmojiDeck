//
//  Suit.swift
//  SimpleCardViews
//
//  Created by Marty Avedon on 12/18/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

enum Suit: Int {
    case Ppl
    case Cats
    case Vehicles
    case Gadgets
    
    func symbol() -> String {
        switch self {
        case .Ppl:
            return "😎"
        case .Cats:
            return "😼"
        case .Vehicles:
            return "🚲"
        case .Gadgets:
            return "🔌"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .Ppl:
            return .black
        case .Vehicles:
            return UIColor(red:0.18, green:0.70, blue:0.29, alpha:1.0)
        case .Gadgets:
            return .orange
        case .Cats:
            return .purple
        }
    }
}
