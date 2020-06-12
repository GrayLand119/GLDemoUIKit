//
//  AppDelegate.swift
//  GLDemoUIKit
//
//  Created by GrayLand on 2020/6/10.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = HomeViewController()
        let nvc = DemoNavigationController.init(vc)
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = nvc
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

