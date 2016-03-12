//
//  AppDelegate.swift
//  FountainKitDemo
//
//  Created by Cesar Tardaguila on 12/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit
import FountainKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window!.rootViewController = ViewController()
        
        self.window!.makeKeyAndVisible()
        return true

    }
}

