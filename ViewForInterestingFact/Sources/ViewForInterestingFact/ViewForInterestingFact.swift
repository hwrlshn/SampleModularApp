//
//  ViewForInterestingFact.swift
//
//
//  Created by Bohdan Hawrylyshyn on 11.05.24.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct ViewForInterestingFact: View {
    
    private let number: Int
    private let fact: String
    
    public init(number: Int, fact: String) {
        self.number = number
        self.fact = fact
    }
    
    public var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("\(number)")
                    .font(.title)
                Text(fact)
                    .font(.subheadline)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

@available(iOS 13.0.0, *)
#Preview {
    ViewForInterestingFact(
        number: 0,
        fact: "aadfssdfsdf sdf sd dfsdf sd dsfds ff ds sfdsfdaa")
}
