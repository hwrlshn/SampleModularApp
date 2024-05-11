//
//  MenuView.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import SwiftUI

protocol MenuViewDelegate: AnyObject {
    func userTappedAgePrediction(by name: String)
    func userTappedColorPicker()
}

struct MenuView: View {
    
    weak var delegate: MenuViewDelegate?
    
    // MARK: - Age Prediction properties
    
    @State private var isShowAgePredictionAlert = false
    @State private var userInput: String = ""
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            List {
                Button {
                    isShowAgePredictionAlert = true
                } label: {
                    Text("Age prediction by name")
                }
                
                Button {
                    delegate?.userTappedColorPicker()
                } label: {
                    Text("Color picker")
                }
            }
        }
        .overlay(
            ZStack {
                if isShowAgePredictionAlert {
                    AgePredictionAlertView(
                        isShowAgePredictionAlert: $isShowAgePredictionAlert,
                        delegate: .constant(delegate),
                        userInput: $userInput)
                }
            }
        )
    }
}

#Preview {
    MenuView()
}
