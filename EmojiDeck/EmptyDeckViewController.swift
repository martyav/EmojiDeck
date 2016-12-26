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
        
        EmojiCard.createFreshDeck()
        
        view.backgroundColor = .white
        
        emptyDeckLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emptyDeckLabel)
        
        emptyDeckLabel.text = "Empty Deck!"
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
        self.drawOneButton.layer.borderColor = UIColor.black.cgColor
        self.drawOneButton.layer.borderWidth = 2
        self.drawOneButton.layer.cornerRadius = 5
        self.drawOneButton.backgroundColor = .white
        
        self.removeOneButton.setTitle(" Remove One ", for: .disabled)
        self.removeOneButton.setTitleColor(.gray, for: .disabled)
        self.removeOneButton.layer.borderColor = UIColor.gray.cgColor
        self.removeOneButton.layer.borderWidth = 2
        self.removeOneButton.layer.cornerRadius = 5
        self.removeOneButton.backgroundColor = .white
        
        self.removeAllButton.setTitle(" Remove All ", for: .disabled)
        self.removeOneButton.setTitleColor(.gray, for: .disabled)
        self.removeAllButton.layer.borderColor = UIColor.gray.cgColor
        self.removeAllButton.layer.borderWidth = 2
        self.removeAllButton.layer.cornerRadius = 5
        self.removeAllButton.backgroundColor = .white
        
        self.showStackButton.setTitle(" Show Stack ", for: .disabled)
        self.showStackButton.setTitleColor(.gray, for: .disabled)
        self.showStackButton.layer.borderColor = UIColor.gray.cgColor
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
        
        removeOneButton.isEnabled = false
        removeAllButton.isEnabled = false
        showStackButton.isEnabled = false
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
        print("did press remove one")
    }
    
    func didPressRemoveAllButton(sender: UIButton) {
        print("did press remove all")
    }
    
    func didPressShowStackButton(sender: UIButton) {
        print("did press show stack")
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
