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
    
    var card = EmojiCard.drawACard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if EmojiCard.currentSizeOfDeck == EmojiCard.cardDeck.count - 1 {
            navigationItem.hidesBackButton = true
        }
        
        let leftOrRight: Double
        let randomTwist: Double
        let angle: Double
        
        print("view did load")
        print(EmojiCard.currentSizeOfDeck)
        
        //MARK: - Card position & style
        
        card.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(card)
        
        card.style()
        
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOffset = CGSize(width: 5, height: 5)
        card.layer.shadowRadius = 20
        card.layer.shadowOpacity = 1
        
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // gives card a jaunty tilt
        if EmojiCard.currentSizeOfDeck % 2 == 0 {
            leftOrRight = -1.0
        } else {
            leftOrRight = 1.0
        }
        
        randomTwist = Double(arc4random_uniform(20))
        angle = (randomTwist/100) * leftOrRight
        card.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        
        //MARK: - Button position & style
        
        let _ = [
            self.removeAllButton,
            self.showStackButton,
            self.removeOneButton,
            self.drawOneButton
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.drawOneButton.setTitle(" Draw Card ", for: .normal)
        self.drawOneButton.setTitleColor(.black, for: .normal)
        self.drawOneButton.setTitleColor(.gray, for: .disabled)
        self.drawOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.drawOneButton.layer.borderColor = UIColor.black.cgColor
        self.drawOneButton.layer.borderWidth = 2
        self.drawOneButton.layer.cornerRadius = 5
        self.drawOneButton.backgroundColor = .white
        
        if EmojiCard.currentSizeOfDeck < 1 {
            self.drawOneButton.layer.borderColor = UIColor.gray.cgColor
            self.drawOneButton.isEnabled = false
        }
        
        self.removeOneButton.setTitle(" Drop Card ", for: .normal)
        self.removeOneButton.setTitleColor(.black, for: .normal)
        self.removeOneButton.setTitleColor(.gray, for: .disabled)
        self.removeOneButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.removeOneButton.layer.borderColor = UIColor.black.cgColor
        self.removeOneButton.layer.borderWidth = 2
        self.removeOneButton.layer.cornerRadius = 5
        self.removeOneButton.backgroundColor = .white
        
        if EmojiCard.discardPile.count == 0 {
            self.removeOneButton.layer.borderColor = UIColor.gray.cgColor
            self.removeOneButton.isEnabled = false
        }
        
        self.removeAllButton.setTitle(" Remove All ", for: .normal)
        self.removeAllButton.setTitleColor(.black, for: .normal)
        self.removeAllButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.removeAllButton.layer.borderColor = UIColor.black.cgColor
        self.removeAllButton.layer.borderWidth = 2
        self.removeAllButton.layer.cornerRadius = 5
        self.removeAllButton.backgroundColor = .white
        
        self.showStackButton.setTitle(" Show Stack ", for: .normal)
        self.showStackButton.setTitleColor(.black, for: .normal)
        self.showStackButton.titleLabel?.font = UIFont(name: "GillSans", size: 25)
        self.showStackButton.layer.borderColor = UIColor.black.cgColor
        self.showStackButton.layer.borderWidth = 2
        self.showStackButton.layer.cornerRadius = 5
        self.showStackButton.backgroundColor = .white
        
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
        print("did press remove one")
        guard EmojiCard.discardPile.index(of: self.card) != 0  && EmojiCard.discardPile.count != 1 else {
            // from https://iosdevcenters.blogspot.com/2016/03/uialertcontroller-in-swift.html, updated for Swift3
            let alertController = UIAlertController(title: "Hey there, pal!", message: "You can't remove the only card...", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
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
            
            let alertController = UIAlertController(title: "We removed", message: "\(EmojiCard.cardDeck[cardToReset!].num.cornerLabel()) \(EmojiCard.cardDeck[cardToReset!].suit.symbol())", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            print("we removed \(EmojiCard.cardDeck[cardToReset!].num.cornerLabel()) \(EmojiCard.cardDeck[cardToReset!].suit.symbol())")
        }
    }
    
    func didPressRemoveAllButton(sender: UIButton) {
        print("did press remove all")
        let newVC = EmptyDeckViewController()
        
        navigationController?.viewControllers = [newVC]
        
        for card in EmojiCard.cardDeck {
            card.canBeDrawn = true
        }
        
        EmojiCard.discardPile = []
        
        let alertController = UIAlertController(title: "Starting fresh!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
        
        if EmojiCard.currentSizeOfDeck == 0 {
            let alertController = UIAlertController(title: "We've got our 40 cards!", message: "There are no more active cards to draw.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let useWideDesign = size.width > size.height
        
        // Step 3: Apply the design to the UI.
        if useWideDesign {
            card.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } else {
            card.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }

        
        coordinator.animate(alongsideTransition: { (context) -> Void in
            // Place code here to perform animations during the rotation.
            // You can pass nil for this closure if not necessary.
        })
    }
}
