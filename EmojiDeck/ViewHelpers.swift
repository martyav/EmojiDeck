//
//  ViewHelpers.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 4/5/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

func addToView(_ arr: [UIView], view: UIView) {
    for element in arr {
        view.addSubview(element)
    }
}

func allowProgrammableConstraints(_ arr: [UIView]) {
    for element in arr {
        element.translatesAutoresizingMaskIntoConstraints = false
    }
}

func generateUI(_ functions: [() -> ()]) {
    for function in functions {
        function()
    }
}

func enable(buttons: [UIButton:Bool]) {
    for (key, value) in buttons {
        key.isEnabled = value
    }
}
