//
//  MenuView.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import SwiftUI
import AgePredictionView

protocol MenuViewDelegate: AnyObject {
    func userTappedAgePrediction(by name: String)
    func userTappedColorPicker()
    func userTappedViewWithColor()
    func userTappedInterestingFact()
}

struct MenuView: View {
    
    weak var delegate: MenuViewDelegate?
    
    // MARK: - Age Prediction properties
    
    @State private var isShowAgePredictionAlert = false
    @State private var userInput: String = ""
    @State private var isDelegateWasCalled = false
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            List {
                
                // MARK: - Age prediction
                
                Button {
                    isShowAgePredictionAlert = true
                } label: {
                    Text("Age prediction by name")
                }
                
                // MARK: - Color picker
                
                Button {
                    delegate?.userTappedColorPicker()
                } label: {
                    Text("Color picker")
                }
                
                // MARK: - View with color
                
                Button {
                    delegate?.userTappedViewWithColor()
                } label: {
                    Text("View with choosed color\n(from ColorPicker)")
                }
                
                // MARK: - Interesting fact
                
                Button {
                    delegate?.userTappedInterestingFact()
                } label: {
                    Text("Interesting fact about number\n(by your predicted age)")
                }
                
            }
        }
        .overlay(
            ZStack {
                if isShowAgePredictionAlert {
                    AgePredictionAlertView(
                        isShowAgePredictionAlert: $isShowAgePredictionAlert,
                        userInput: $userInput,
                        isDelegateWasCalled: $isDelegateWasCalled)
                }
            }
        )
        .onChange(of: isDelegateWasCalled) { _ in
            delegate?.userTappedAgePrediction(by: userInput)
        }
    }
}

#Preview {
    MenuView()
}
