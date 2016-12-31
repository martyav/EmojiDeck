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

/*
 NOTES
 
 location is a decimal number.
 it represents the starting postion for a color.
 each item inside the locations array indicates the starting point for a color in the colors array.
 the top of the frame is 0, and the bottom of the frame is 1.0.
 colors: [.white, .black], locations: [0.0, 1.0] indicates a gradient running from white to black
*/
