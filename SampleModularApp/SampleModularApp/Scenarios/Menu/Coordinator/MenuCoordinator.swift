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
import ViewWithColor
import AgePredictionView
import ViewForInterestingFact

protocol MenuCoordinatorDelegate: AnyObject {
    func menuCoordinatorDidFinish()
}

final class MenuCoordinator: NavigationCoordinator {
    
    weak var delegate: MenuCoordinatorDelegate?
    
    var navigationController: UINavigationController
    
    private var colorForView: Color = .red
    private var predictedAge = 0
    
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

// MARK: - Menu delegate -

extension MenuCoordinator: MenuViewDelegate {
    
    func userTappedAgePrediction(by name: String) {
        Networking.shared.agePrediction(by: name) { [weak self] result, error in
            guard error == nil
            else { return }
            self?.predictedAge = result?.age ?? 0
            DispatchQueue.main.async {
                let view = AgePredictionView(name: result?.name ?? "", age: result?.age ?? 0)
                let vc: UIHostingController = .init(rootView: view)
                self?.navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    func userTappedColorPicker() {
        DispatchQueue.main.async { [weak self] in
            var view = ColorPickerView(color: self?.colorForView ?? .red)
            view.delegate = self
            let vc: UIHostingController = .init(rootView: view)
            self?.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func userTappedViewWithColor() {
        DispatchQueue.main.async { [weak self] in
            let view = ViewWithColor(color: self?.colorForView ?? .red)
            let vc: UIHostingController = .init(rootView: view)
            self?.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func userTappedInterestingFact() {
        Networking.shared.interestingFact(by: predictedAge) { [weak self] result, error in
            guard error == nil
            else { return }
            DispatchQueue.main.async {
                let view = ViewForInterestingFact(number: self?.predictedAge ?? 0, fact: result ?? "No fact")
                let vc: UIHostingController = .init(rootView: view)
                self?.navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
}

// MARK: - Color picker delegate -

extension MenuCoordinator: ColorPickerDelegate {
    
    func shareColor(color: Color) {
        colorForView = color
    }
    
}
