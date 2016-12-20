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
    //var card = EmojiCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
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
            removeOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            removeOneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            drawOneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            drawOneButton.bottomAnchor.constraint(equalTo: removeOneButton.bottomAnchor, constant: -38),
            removeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            removeAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            showStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            showStackButton.bottomAnchor.constraint(equalTo: removeAllButton.bottomAnchor, constant: -38)
            ].map{ $0.isActive = true }
        
        self.drawOneButton.addTarget(self, action: #selector(didPressDrawOneButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("layout subviews!!!")
    }
    
    func didPressDrawOneButton(sender: UIButton) {
        print("Did press button.")
        
        // create a destination vc
        
        let newVC = EmojiCardViewController()
        newVC.view.backgroundColor = .green
        
        // move to our destination vc
        
        // present it modally
        //self.present(greenVC, animated: true, completion: nil)
        
        // have the nav manage it
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
