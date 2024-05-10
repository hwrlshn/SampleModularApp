//
//  AppDelegate.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var appCoordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = .init()
        if let window = window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }
        window?.makeKeyAndVisible()
        return true
    }
    
}

