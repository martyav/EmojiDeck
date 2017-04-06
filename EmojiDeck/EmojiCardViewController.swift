//
//  EmojiCardViewController.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class EmojiCardViewController: UIViewController {
    
    var drawOneButton: ControlButton!
    var removeOneButton: ControlButton!
    var showStackButton: ControlButton!
    var removeAllButton: ControlButton!
    
    var card = drawACard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if EmojiCard.currentSizeOfDeck == EmojiCard.cardDeck.count - 1 {
            navigationItem.hidesBackButton = true
        }
        
        print(EmojiCard.currentSizeOfDeck)
        
        generateUI([layoutCard, card.style, card.tilt, layoutButtons, disableButtonsIfDeckIsTooSmall])
        
        drawOneButton.addTarget(self, action: #selector(didPressDrawOneButton(sender:)), for: .touchUpInside)
        removeOneButton.addTarget(self, action: #selector(didPressRemoveOneButton(sender:)), for: .touchUpInside)
        removeAllButton.addTarget(self, action: #selector(didPressRemoveAllButton(sender:)), for: .touchUpInside)
        showStackButton.addTarget(self, action: #selector(didPressShowStackButton(sender:)), for: .touchUpInside)
    }
    
    func layoutCard() {
        self.view.addSubview(card)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        
        _ = [
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ].map { $0.isActive = true }
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
        
        drawOneButton.setTitle(" Draw Card ", for: .normal)
        removeOneButton.setTitle(" Drop Card ", for: .normal)
        removeAllButton.setTitle(" Remove All ", for: .normal)
        showStackButton.setTitle(" Show Stack ", for: .normal)

        
    }
    
    func disableButtonsIfDeckIsTooSmall() {
        if EmojiCard.currentSizeOfDeck < 1 {
            drawOneButton.layer.borderColor = UIColor.gray.cgColor
            drawOneButton.isEnabled = false
        }
        
        if EmojiCard.discardPile.count == 0 {
            removeOneButton.layer.borderColor = UIColor.gray.cgColor
            removeOneButton.isEnabled = false
        }
        
    }
    
    func didPressDrawOneButton(sender: UIButton) {
        
        let newVC = EmojiCardViewController()
        print("we drew \(newVC.card.num.cornerLabel()) \(newVC.card.suit.symbol())")
        
        if card.suit.color() != .black {
            newVC.view.backgroundColor = card.suit.color()
        } else {
            newVC.view.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        }
        
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(newVC, animated: true)
        }
        
    }
    
    func didPressRemoveOneButton(sender: UIButton) {
        
        guard EmojiCard.discardPile.index(of: self.card) != 0  && EmojiCard.discardPile.count != 1 else {
            showAlert(title: "Hey there, pal!", message: "You can't remove the only card...", presentOn: self)
            print("you can't remove the only card")
            return
        }
        
        let upperLimitForRandom = navigationController!.viewControllers.count
        let indexToRemove = Int(arc4random_uniform(UInt32(upperLimitForRandom)))
        
        guard indexToRemove != 0 else {
            return didPressRemoveOneButton(sender: sender)
        }
        
        if let _ = navigationController?.viewControllers[indexToRemove] as? EmptyDeckViewController {
            print("we tried to remove the empty deck vc")
            return didPressRemoveOneButton(sender: sender)
        }
        
        if EmojiCard.discardPile.index(of: self.card) == indexToRemove - 1 {
            print("you can't remove the top card")
            return didPressRemoveOneButton(sender: sender)
        }
        
        let indexToRemoveFromDiscards = indexToRemove - 1
        let cardToReset = EmojiCard.cardDeck.index(of: EmojiCard.discardPile[indexToRemoveFromDiscards])
        
        EmojiCard.cardDeck[cardToReset!].canBeDrawn = true
        EmojiCard.discardPile.remove(at: indexToRemove - 1)
        navigationController?.viewControllers.remove(at: indexToRemove)
        
        if EmojiCard.currentSizeOfDeck >= 1 {
            drawOneButton.isEnabled = true
            drawOneButton.layer.borderColor = UIColor.black.cgColor
            
            showAlert(title: "We removed", message: "\(EmojiCard.cardDeck[cardToReset!].num.cornerLabel()) \(EmojiCard.cardDeck[cardToReset!].suit.symbol())", presentOn: self)
            
            print("we removed \(EmojiCard.cardDeck[cardToReset!].num.cornerLabel()) \(EmojiCard.cardDeck[cardToReset!].suit.symbol())")
            
        }
        
    }
    
    func didPressRemoveAllButton(sender: UIButton) {
        
        let newVC = EmptyDeckViewController()
        
        navigationController?.viewControllers = [newVC]
        
        for card in EmojiCard.cardDeck {
            card.canBeDrawn = true
        }
        
        EmojiCard.discardPile = []
        
        showAlert(title: "Starting fresh!", message: "", presentOn: self)

    }
    
    func didPressShowStackButton(sender: UIButton) {
        print("did press show stack")
        let destination = StackTableViewController()
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(destination, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if EmojiCard.currentSizeOfDeck == 0 {
            showAlert(title: "We've got our 40 cards!", message: "There are no more active cards to draw.", presentOn: self)
        }
    }
    
}
