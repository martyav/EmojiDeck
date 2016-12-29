//
//  UIView + Gradient.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

// from http://stackoverflow.com/a/37903364 & modified for swift3/american english

extension UIView {
    func applyGradient(colors: [UIColor]) -> Void {
        self.applyGradient(colors: colors, locations: nil)
    }
    
    func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}
