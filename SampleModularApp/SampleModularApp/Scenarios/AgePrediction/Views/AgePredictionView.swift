//
//  AgePredictionView.swift
//  SampleModularApp
//
//  Created by Bohdan Hawrylyshyn on 10.05.24.
//

import SwiftUI

struct AgePredictionView: View {
    
    let name: String
    let age: Int
    
    var body: some View {
        VStack {
            Text("Your name: \(name)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Your preddicted age: \(age)")
                .font(.subheadline)
            Spacer()
                .frame(height: 100)
            Text("(via api.agify.io)")
                .font(.caption2)
        }
    }
}

#Preview {
    AgePredictionView(
        name: "Name",
        age: 33)
}
