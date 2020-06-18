//
//  AppDelegate.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/17/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppRouter.initRootViewController(&window)
        return true
    }
}
