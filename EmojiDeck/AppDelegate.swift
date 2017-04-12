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
      //      let textLayer = CATextLayer()
      //      splashView!.layer.addSublayer(textLayer)
            
            window.addSubview(splashView!)
            
            splashView!.layer.backgroundColor = UIColor.black.cgColor
            
            splashView!.translatesAutoresizingMaskIntoConstraints = false
            
            _ = [
                splashView!.topAnchor.constraint(equalTo: window.topAnchor),
                splashView!.widthAnchor.constraint(equalTo: window.widthAnchor),
                splashView!.heightAnchor.constraint(equalTo: window.heightAnchor),
                splashView!.leadingAnchor.constraint(equalTo: window.leadingAnchor)
            ].map { $0.isActive = true }
            
       //     textLayer.font = UIFont(name: "AppleColorEmoji", size: 72)
       //     textLayer.alignmentMode = kCAAlignmentCenter
            
            UIView.animateKeyframes(withDuration: 4, delay: 0, options: [UIViewKeyframeAnimationOptions.calculationModeLinear], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    self.splashView!.layer.backgroundColor = UIColor.black.cgColor
         //           textLayer.string = "😎"
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    self.splashView!.layer.backgroundColor = UIColor.purple.cgColor
           //         textLayer.string = "🍆"
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    self.splashView!.layer.backgroundColor = UIColor.orange.cgColor
             //        textLayer.string = "💩"

                }

                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                    self.splashView!.layer.backgroundColor = UIColor(red:0.18, green:0.70, blue:0.29, alpha:1.0).cgColor
               //     textLayer.string = "😼"

                }
            }, completion: { finish in
                UIView.animate(withDuration: 0.5) {
                    self.splashView!.alpha = 0
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

