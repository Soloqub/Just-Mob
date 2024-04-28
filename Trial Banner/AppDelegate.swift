//
//  AppDelegate.swift
//  Trial Banner
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        defer {
            self.window = window
        }
        
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        
        return true
    }

}

