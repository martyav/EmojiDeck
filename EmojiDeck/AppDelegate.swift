//
//  AppDelegate.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var card1: EmojiCard?
    var card2: EmojiCard?
    var card3: EmojiCard?
    var card4: EmojiCard?
    var splashView: UIView?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC = EmptyDeckViewController()
        let navController = UINavigationController(rootViewController: rootVC)
        
        if let window = self.window {
            window.rootViewController = navController
            navController.navigationBar.isTranslucent = true
            window.makeKeyAndVisible()
            
            splashView = UIView()
            card1 = EmojiCard()
            card2 = EmojiCard()
            card3 = EmojiCard()
            card4 = EmojiCard()
            
            window.addSubview(splashView!)
            splashView!.addSubview(card1!)
            splashView!.addSubview(card2!)
            splashView!.addSubview(card3!)
            splashView!.addSubview(card4!)
            
            card1!.suit = .Cool
            card1!.num = .Ace
            
            card2!.suit = .Eggplants
            card2!.num = .Ace
            
            card3!.suit = .Poo
            card3!.num = .Ace
            
            card4!.suit = .Cats
            card4!.num = .Ace
            
            card1!.alpha = 0
            card2!.alpha = 0
            card3!.alpha = 0
            card4!.alpha = 0
            
            splashView!.layer.backgroundColor = UIColor.black.cgColor
            
            allowProgrammableConstraints([splashView!, card1!, card2!, card3!, card4!])
            card1!.style()
            card2!.style()
            card3!.style()
            card4!.style()
            
            _ = [
                splashView!.topAnchor.constraint(equalTo: window.topAnchor),
                splashView!.widthAnchor.constraint(equalTo: window.widthAnchor),
                splashView!.heightAnchor.constraint(equalTo: window.heightAnchor),
                splashView!.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                
                card1!.centerXAnchor.constraint(equalTo: splashView!.centerXAnchor),
                card1!.centerYAnchor.constraint(equalTo: splashView!.centerYAnchor),
                
                card2!.centerXAnchor.constraint(equalTo: splashView!.centerXAnchor, constant: 0),
                card2!.centerYAnchor.constraint(equalTo: splashView!.centerYAnchor),
                
                card3!.centerXAnchor.constraint(equalTo: splashView!.centerXAnchor, constant: 0),
                card3!.centerYAnchor.constraint(equalTo: splashView!.centerYAnchor),
                
                card4!.centerXAnchor.constraint(equalTo: splashView!.centerXAnchor, constant: 0),
                card4!.centerYAnchor.constraint(equalTo: splashView!.centerYAnchor)
            ].map { $0.isActive = true }
            
            UIView.animateKeyframes(withDuration: 5, delay: 0, options: [UIViewKeyframeAnimationOptions.calculationModeLinear], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.20) {
                    self.splashView!.layer.backgroundColor = UIColor.black.cgColor
                    
                    self.card1!.alpha = 1
                    
                    self.card1!.center.y = window.frame.midY
                    self.card1!.center.x = window.frame.midX
                    
                    self.card1!.tilt()
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.20, relativeDuration: 0.20) {
                    self.splashView!.layer.backgroundColor = UIColor.purple.cgColor
                    
                    self.card2!.alpha = 1
                    
                    self.card2!.center.y = window.frame.midY
                    self.card2!.center.x = window.frame.midX
                    
                    self.card2!.tilt()
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.40, relativeDuration: 0.20) {
                    self.splashView!.layer.backgroundColor = UIColor.orange.cgColor
                    
                    self.card3!.alpha = 1
                    
                    self.card3!.center.y = window.frame.midY
                    self.card3!.center.x = window.frame.midX
                    
                    self.card3!.tilt()
                }

                UIView.addKeyframe(withRelativeStartTime: 0.60, relativeDuration: 0.20) {
                    self.splashView!.layer.backgroundColor = UIColor(red:0.18, green:0.70, blue:0.29, alpha:1.0).cgColor
                    
                    self.card4!.alpha = 1
                    
                    self.card4!.center.y = window.frame.midY
                    self.card4!.center.x = window.frame.midX
                    
                    self.card4!.tilt()
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.80, relativeDuration: 0.20) {
                    self.card1!.center.x = window.frame.midX - 40
                    self.card2!.center.x = window.frame.midX - 20
                    self.card3!.center.x = window.frame.midX
                    self.card4!.center.x = window.frame.midX + 20
                    
                    self.card4!.tilt()
                    
                }
                
            }, completion: { finish in
                UIView.animate(withDuration: 1) {
                    self.splashView!.transform = CGAffineTransform(translationX: 0, y: -window.frame.maxY)
                }
            })
            
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

