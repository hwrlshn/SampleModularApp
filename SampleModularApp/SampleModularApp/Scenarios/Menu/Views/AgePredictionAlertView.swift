//
//  AgePredictionAlertView.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import SwiftUI

struct AgePredictionAlertView: View {
    
    @Binding var isShowAgePredictionAlert: Bool
    @Binding var delegate: MenuViewDelegate?
    @Binding var userInput: String
    
    var body: some View {
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
                    delegate?.userTappedAgePrediction(by: userInput)
                    userInput = ""
                    delegate = nil
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
    }
}
