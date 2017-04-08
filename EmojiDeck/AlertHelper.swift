//
//  AlertHelpers.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 4/6/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

func showAlert(title: String, message: String, presentOn: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        print("OK")
    }
    
    alertController.addAction(okAction)
    presentOn.present(alertController, animated: true, completion: nil)
}
