//
//  EmptyDeckViewController.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/23/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class EmptyDeckViewController: UIViewController {
    
    var emptyDeckLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
    
    var drawOneButton: ControlButton!
    var removeOneButton: ControlButton!
    var showStackButton: ControlButton!
    var removeAllButton: ControlButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if EmojiCard.cardDeck.count == 0 {
            createFreshDeck()
        }
        
        view.applyGradient(colors: [.black, UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1), .black], locations: [0.0, 0.5, 1.0])
        
        generateUI([layoutEmptyLabel, layoutButtons, styleEmptyLabel, styleButtons])
        enable(buttons: [
                drawOneButton: true,
                showStackButton: false,
                removeOneButton: false,
                removeAllButton: false
            ])
        
        self.drawOneButton.addTarget(self, action: #selector(didPressDrawOneButton(sender:)), for: .touchUpInside)
    }
    
    func layoutEmptyLabel() {
        
        view.addSubview(emptyDeckLabel)
        
        emptyDeckLabel.translatesAutoresizingMaskIntoConstraints = false
        
        _ = [
            emptyDeckLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyDeckLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ].map{ $0.isActive = true }
    }
    
    func layoutButtons() {
        
        drawOneButton = ControlButton()
        removeOneButton = ControlButton()
        removeAllButton = ControlButton()
        showStackButton = ControlButton()
        
        addToView([
            drawOneButton,
            removeOneButton,
            showStackButton,
            removeAllButton
        ], view: self.view)
        
        allowProgrammableConstraints([
            drawOneButton,
            removeOneButton,
            showStackButton,
            removeAllButton
        ])
        
        _ = [
            removeOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            removeOneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            drawOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            drawOneButton.bottomAnchor.constraint(equalTo: removeOneButton.bottomAnchor, constant: -48),
            removeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            removeAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            showStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            showStackButton.bottomAnchor.constraint(equalTo: removeAllButton.bottomAnchor, constant: -48)
        ].map{ $0.isActive = true }
        
    }
    
    func styleButtons() {
        
        drawOneButton.setTitle(" Draw Card ", for: .normal)
        removeOneButton.setTitle(" Drop Card ", for: .normal)
        removeAllButton.setTitle(" Remove All ", for: .normal)
        showStackButton.setTitle(" Show Stack ", for: .normal)
        
    }
    
    func styleEmptyLabel() {
        
        emptyDeckLabel.text = "Start Deck!"
        emptyDeckLabel.font = UIFont(name: "Superclarendon-Black", size: 30)
        emptyDeckLabel.textColor = .white
        emptyDeckLabel.layer.shadowColor = UIColor.white.cgColor
        emptyDeckLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        emptyDeckLabel.layer.shadowRadius = 35
        emptyDeckLabel.layer.shadowOpacity = 1
        
    }
    
    func didPressDrawOneButton(sender: UIButton) {
        
        print("Did press draw button.")
        
        let newVC = EmojiCardViewController()
        print("we drew \(newVC.card.num.cornerLabel()) \(newVC.card.suit.symbol())")
        
        if newVC.card.suit.color() != .black {
            newVC.view.backgroundColor = newVC.card.suit.color()
        } else {
            newVC.view.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        }
        
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(newVC, animated: true)
        }
        
    }
    
}
