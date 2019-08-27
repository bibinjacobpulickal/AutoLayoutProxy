//
//  AppDelegate.swift
//  AutoLayoutProxyiOSExample
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window  = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController  = UINavigationController(rootViewController: MainViewController())

        return true
    }
}
