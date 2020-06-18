//
//  AppRouter.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

struct AppRouter {
    static func initRootViewController(_ window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = CheckoutVC.instance
        vc.viewModel = CheckoutViewModel()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
