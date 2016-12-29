//
//  EmptyDeckViewController.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/23/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class EmptyDeckViewController: UIViewController {
    
    var drawOneButton = UIButton(type: UIButtonType.system)
    var removeOneButton = UIButton(type: UIButtonType.system)
    var showStackButton = UIButton(type: UIButtonType.system)
    var removeAllButton = UIButton(type: UIButtonType.system)
    var emptyDeckLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if EmojiCard.cardDeck.count == 0 {
            EmojiCard.createFreshDeck()
        }

        view.applyGradient(colors: [.black, UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1), .black], locations: [0.0, 0.5, 1.0])
        
        emptyDeckLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emptyDeckLabel)
        
        emptyDeckLabel.text = "Start Deck!"
        emptyDeckLabel.font = UIFont(name: "Superclarendon-Black", size: 30)
        emptyDeckLabel.textColor = .white
        emptyDeckLabel.layer.shadowColor = UIColor.white.cgColor
        emptyDeckLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        emptyDeckLabel.layer.shadowRadius = 35
        emptyDeckLabel.layer.shadowOpacity = 1
        emptyDeckLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyDeckLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let _ = [
            self.removeAllButton,
            self.showStackButton,
            self.removeOneButton,
            self.drawOneButton
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.drawOneButton.setTitle(" Draw Card ", for: .normal)
        self.drawOneButton.setTitleColor(.black, for: .normal)
        self.drawOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.drawOneButton.layer.borderColor = UIColor.black.cgColor
        self.drawOneButton.layer.borderWidth = 2
        self.drawOneButton.layer.cornerRadius = 5
        self.drawOneButton.backgroundColor = .white
        
        self.removeOneButton.setTitle(" Drop Card ", for: .disabled)
        self.removeOneButton.setTitleColor(.gray, for: .disabled)
        self.removeOneButton.setTitleColor(.black, for: .normal)
        self.removeOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.removeOneButton.layer.borderColor = UIColor.gray.cgColor
        self.removeOneButton.layer.borderWidth = 2
        self.removeOneButton.layer.cornerRadius = 5
        self.removeOneButton.backgroundColor = .white
        
        self.removeAllButton.setTitle(" Remove All ", for: .normal)
        self.removeAllButton.setTitleColor(.gray, for: .disabled)
        self.removeAllButton.setTitleColor(.black, for: .normal)
        self.removeAllButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.removeAllButton.layer.borderColor = UIColor.gray.cgColor
        self.removeAllButton.layer.borderWidth = 2
        self.removeAllButton.layer.cornerRadius = 5
        self.removeAllButton.backgroundColor = .white
        
        self.showStackButton.setTitle(" Show Stack ", for: .normal)
        self.showStackButton.setTitleColor(.gray, for: .disabled)
        self.showStackButton.setTitleColor(.black, for: .normal)
        self.showStackButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.showStackButton.layer.borderColor = UIColor.gray.cgColor
        self.showStackButton.layer.borderWidth = 2
        self.showStackButton.layer.cornerRadius = 5
        self.showStackButton.backgroundColor = .white
        
        if (navigationController?.viewControllers.count)! > 1  {
            showStackButton.isEnabled = true
            removeOneButton.isEnabled = true
            removeAllButton.isEnabled = true
            
            self.showStackButton.layer.borderColor = UIColor.black.cgColor
            self.removeOneButton.layer.borderColor = UIColor.black.cgColor
            self.removeAllButton.layer.borderColor = UIColor.black.cgColor
        } else {
            showStackButton.isEnabled = false
            removeOneButton.isEnabled = false
            removeAllButton.isEnabled = false
        }
        
        self.view.addSubview(drawOneButton)
        self.view.addSubview(removeOneButton)
        self.view.addSubview(removeAllButton)
        self.view.addSubview(showStackButton)
        
        let _ = [
            removeOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            removeOneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            drawOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            drawOneButton.bottomAnchor.constraint(equalTo: removeOneButton.bottomAnchor, constant: -48),
            removeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            removeAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            showStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            showStackButton.bottomAnchor.constraint(equalTo: removeAllButton.bottomAnchor, constant: -48)
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
        
        // present it modally
        //self.present(newVC, animated: true, completion: nil)
        
        // let nav handle it
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(newVC, animated: true)
        }
    }
    
    func didPressRemoveOneButton(sender: UIButton) {
        // commenting this in will make remove one remove top cards even on the emojivc's
//        print("did press remove one")
//        if EmojiCard.discardPile.count == 1 {
//            print("you can't remove the only card")
//            return
//        }
//        
//        let upperLimitForRandom = navigationController!.viewControllers.count
//        let indexToRemove = Int(arc4random_uniform(UInt32(upperLimitForRandom)))
//        
//        guard indexToRemove != 0 else { return didPressRemoveOneButton(sender: sender) }
//        
//        if let _ = navigationController?.viewControllers[indexToRemove] as? EmptyDeckViewController {
//            print("we tried to remove the empty deck vc")
//            return didPressRemoveOneButton(sender: sender)
//        }
//        
//        let cardToReset = EmojiCard.cardDeck.index(of: EmojiCard.discardPile[indexToRemove - 1])
//        print("we removed \(EmojiCard.cardDeck[cardToReset!].topNumberLabel?.text) \(EmojiCard.cardDeck[cardToReset!].topSuitLabel?.text)")
//        EmojiCard.cardDeck[cardToReset!].canBeDrawn = true
//        EmojiCard.discardPile.remove(at: indexToRemove - 1)
//        navigationController?.viewControllers.remove(at: indexToRemove)
//        
//        if EmojiCard.currentSizeOfDeck >= 1 {
//            drawOneButton.isEnabled = true
//            drawOneButton.layer.borderColor = UIColor.black.cgColor
//        }
    }
    
    func didPressRemoveAllButton(sender: UIButton) {
        print("did press remove all")
        let newVC = EmptyDeckViewController()
        
        navigationController?.viewControllers = [newVC]
        
        for card in EmojiCard.cardDeck {
            card.canBeDrawn = true
        }
        
        EmojiCard.discardPile = []
    }
    
    func didPressShowStackButton(sender: UIButton) {
        print("did press show stack")
        
        let destination = StackTableViewController()
        if let navVC = self.navigationController {
            print("nav found")
            navVC.pushViewController(destination, animated: true)
        }
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
