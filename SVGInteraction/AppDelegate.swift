//
//  AppDelegate.swift
//  SVGInteraction
//
//  Created by Ankur Lahiry on 6/12/19.
//  Copyright © 2019 Prefeex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let screen = UIScreen.main.bounds
        
        window = UIWindow(frame: screen)
        
        let navViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navViewController") as! UINavigationController
        window?.rootViewController = navViewController
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}

