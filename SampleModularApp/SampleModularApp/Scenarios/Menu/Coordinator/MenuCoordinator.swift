//
//  MenuCoordinator.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import UIKit
import SwiftUI
import Networking
import ColorPickerView

protocol MenuCoordinatorDelegate: AnyObject {
    func menuCoordinatorDidFinish()
}

final class MenuCoordinator: NavigationCoordinator {
    
    weak var delegate: MenuCoordinatorDelegate?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isNavStackEmpty = navigationController.viewControllers.isEmpty
        var view = MenuView()
        view.delegate = self
        let vc = UIHostingController(rootView: view)
        navigationController.pushViewController(vc, animated: true)
        if !isNavStackEmpty {
            navigationController.viewControllers.remove(at: 0)
        }
    }
}

extension MenuCoordinator: MenuViewDelegate {
    
    func userTappedColorPicker() {
        DispatchQueue.main.async { [weak self] in 
            let view = ColorPickerView()
            let vc: UIHostingController = .init(rootView: view)
            self?.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func userTappedAgePrediction(by name: String) {
        Networking.shared.agePrediction(by: name) { [weak self] result, error in
            guard error == nil
            else { return }
            DispatchQueue.main.async {
                let view = AgePredictionView(name: result?.name ?? "", age: result?.age ?? 0)
                let vc: UIHostingController = .init(rootView: view)
                self?.navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
}
