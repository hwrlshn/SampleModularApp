//
//  AgePredictionAlertView.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct AgePredictionAlertView: View {
    
    @Binding public var isShowAgePredictionAlert: Bool
    @Binding public var userInput: String
    @Binding public var isDelegateWasCalled: Bool
    
    public init(
        isShowAgePredictionAlert: Binding<Bool>,
        userInput: Binding<String>,
        isDelegateWasCalled: Binding<Bool>) {
            self._isShowAgePredictionAlert = isShowAgePredictionAlert
            self._userInput = userInput
            self._isDelegateWasCalled = isDelegateWasCalled
        }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Enter the name (eng only)")
                TextField("Name", text: self.$userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    isShowAgePredictionAlert = false
                    isDelegateWasCalled.toggle()
                }) {
                    Text("OK")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding(50)
        }
        .onAppear {
            userInput = ""
        }
    }
}
