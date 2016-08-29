//
//  AppDelegate.swift
//  FountainKitDemo
//
//  Created by Cesar Tardaguila on 12/3/2016.
//

import UIKit
import FountainKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window!.rootViewController = MoviesViewController()
        
        self.window!.makeKeyAndVisible()
        return true

    }
}

