//
//  AppCoordinator.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import UIKit
import SwiftUI

enum AppChildCoordinator {
    case main
    case agePrediction
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var childCoordinators = [AppChildCoordinator: Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
        let navigationController: UINavigationController = .init()
        self.navigationController = navigationController
        self.window.rootViewController = self.navigationController
    }
    
    func start() {
        showMenu()
    }
    
}

// MARK: - Delegate

extension AppCoordinator: MenuCoordinatorDelegate {
    
    func menuCoordinatorDidFinish() {
        childCoordinators[.main] = nil
        showMenu()
    }
    
}

// MARK: - asasddasdasd

private extension AppCoordinator {
    
    func showMenu() {
        let menuCoordinator: MenuCoordinator = .init(navigationController: navigationController)
        menuCoordinator.delegate = self
        childCoordinators[.main] = menuCoordinator
        menuCoordinator.start()
    }
    
}
