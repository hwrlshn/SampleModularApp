// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0.0, *)
public struct AgePredictionView: View {
    
    let name: String
    let age: Int
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public var body: some View {
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

@available(iOS 14.0.0, *)
#Preview {
    AgePredictionView(
        name: "Name",
        age: 33)
}
