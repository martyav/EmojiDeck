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
    var drawOneButton = UIButton(type: UIButtonType.system)
    var removeOneButton = UIButton(type: UIButtonType.system)
    var showStackButton = UIButton(type: UIButtonType.system)
    var removeAllButton = UIButton(type: UIButtonType.system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if EmojiCard.cardDeck.count == 0 {
            EmojiCard.createFreshDeck()
        }
        
        view.applyGradient(colors: [.black, UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1), .black], locations: [0.0, 0.5, 1.0])
        
        run(functions: [layoutEmptyLabel, layoutButtons])
        run(functions: [styleEmptyLabel, styleButtons])
        
        addButtonFunctionality()
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
        
        view.addSubview(drawOneButton)
        view.addSubview(removeOneButton)
        view.addSubview(removeAllButton)
        view.addSubview(showStackButton)
        
        _ = [
            removeAllButton,
            showStackButton,
            removeOneButton,
            drawOneButton
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
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
        drawOneButton.setTitleColor(.black, for: .normal)
        drawOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        drawOneButton.layer.borderColor = UIColor.black.cgColor
        drawOneButton.layer.borderWidth = 2
        drawOneButton.layer.cornerRadius = 5
        drawOneButton.backgroundColor = .white
        
        removeOneButton.setTitle(" Drop Card ", for: .disabled)
        removeOneButton.setTitleColor(.gray, for: .disabled)
        removeOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        removeOneButton.layer.borderColor = UIColor.gray.cgColor
        removeOneButton.layer.borderWidth = 2
        removeOneButton.layer.cornerRadius = 5
        removeOneButton.backgroundColor = .white
        
        removeAllButton.setTitle(" Remove All ", for: .normal)
        removeAllButton.setTitleColor(.gray, for: .disabled)
        removeAllButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        removeAllButton.layer.borderColor = UIColor.gray.cgColor
        removeAllButton.layer.borderWidth = 2
        removeAllButton.layer.cornerRadius = 5
        removeAllButton.backgroundColor = .white
        
        showStackButton.setTitle(" Show Stack ", for: .normal)
        showStackButton.setTitleColor(.gray, for: .disabled)
        showStackButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        showStackButton.layer.borderColor = UIColor.gray.cgColor
        showStackButton.layer.borderWidth = 2
        showStackButton.layer.cornerRadius = 5
        showStackButton.backgroundColor = .white
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
    
    func run(functions: [() -> ()]) {
        for function in functions {
            function()
        }
    }
    
    func addButtonFunctionality() {
        
        drawOneButton.isEnabled = true
        showStackButton.isEnabled = false
        removeOneButton.isEnabled = false
        removeAllButton.isEnabled = false
        
        self.drawOneButton.addTarget(self, action: #selector(didPressDrawOneButton(sender:)), for: .touchUpInside)
        
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
