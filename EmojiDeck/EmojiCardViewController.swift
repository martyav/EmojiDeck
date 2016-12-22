//
//  EmojiCardViewController.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class EmojiCardViewController: UIViewController {

    var drawOneButton = UIButton(type: UIButtonType.system)
    var removeOneButton = UIButton(type: UIButtonType.system)
    var showStackButton = UIButton(type: UIButtonType.system)
    var removeAllButton = UIButton(type: UIButtonType.system)
    var card = EmojiCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        card.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(card)
        
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let _ = [
            self.removeAllButton,
            self.showStackButton,
            self.removeOneButton,
            self.drawOneButton
        ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.drawOneButton.setTitle(" Draw Card ", for: .normal)
        self.drawOneButton.setTitleColor(.white, for: .normal)
        self.drawOneButton.layer.borderColor = UIColor.white.cgColor
        self.drawOneButton.layer.borderWidth = 1
        
        self.removeOneButton.setTitle(" Remove Card ", for: .normal)
        self.removeOneButton.setTitleColor(.white, for: .normal)
        self.removeOneButton.layer.borderColor = UIColor.white.cgColor
        self.removeOneButton.layer.borderWidth = 1
        
        self.removeAllButton.setTitle(" Remove All ", for: .normal)
        self.removeAllButton.setTitleColor(.white, for: .normal)
        self.removeAllButton.layer.borderColor = UIColor.white.cgColor
        self.removeAllButton.layer.borderWidth = 1
        
        self.showStackButton.setTitle(" Show Stack ", for: .normal)
        self.showStackButton.setTitleColor(.white, for: .normal)
        self.showStackButton.layer.borderColor = UIColor.white.cgColor
        self.showStackButton.layer.borderWidth = 1
        
        self.view.addSubview(drawOneButton)
        self.view.addSubview(removeOneButton)
        self.view.addSubview(removeAllButton)
        self.view.addSubview(showStackButton)
        
        let _ = [
            removeOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            removeOneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            drawOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            drawOneButton.bottomAnchor.constraint(equalTo: removeOneButton.bottomAnchor, constant: -38),
            removeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            removeAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            showStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            showStackButton.bottomAnchor.constraint(equalTo: removeAllButton.bottomAnchor, constant: -38)
            ].map{ $0.isActive = true }
        
        self.drawOneButton.addTarget(self, action: #selector(didPressDrawOneButton(sender:)), for: .touchUpInside)
        self.removeOneButton.addTarget(self, action: #selector(didPressRemoveOneButton(sender:)), for: .touchUpInside)
        self.removeAllButton.addTarget(self, action: #selector(didPressRemoveAllButton(sender:)), for: .touchUpInside)
        self.showStackButton.addTarget(self, action: #selector(didPressShowStackButton(sender:)), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("layout subviews!!!")
    }
    
    func didPressDrawOneButton(sender: UIButton) {
        print("Did press draw button.")
        
        // create a destination vc
        
        let newVC = EmojiCardViewController()
        newVC.view.backgroundColor = card.suit.color()
        
        // present it modally
        //self.present(newVC, animated: true, completion: nil)
        
        // let nav handle it
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(newVC, animated: true)
        }
        
        // add to array
        CardStack.shared.store.append(self.card)

    }
    
    func didPressRemoveOneButton(sender: UIButton) {
        print("did press remove one")
        let currentIndex = CardStack.shared.store.count - 1
        let cardToRemove = Int(arc4random_uniform(UInt32(CardStack.shared.store.count)))
        guard cardToRemove != currentIndex else {
            return didPressRemoveOneButton(sender: removeOneButton)
        }
        CardStack.shared.store.remove(at: cardToRemove)
    }
    
    func didPressRemoveAllButton(sender: UIButton) {
        print("did press remove all")
        CardStack.shared.store = []
    }
    
    func didPressShowStackButton(sender: UIButton) {
        print("did press show stack")
        // make a tableview
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
}
