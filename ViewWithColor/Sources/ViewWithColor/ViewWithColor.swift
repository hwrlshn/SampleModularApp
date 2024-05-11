// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0, *)
public struct ViewWithColor: View {
    
    let color: Color
    
    public init(color: Color) {
        self.color = color
    }
    
    public var body: some View {
        color
            .ignoresSafeArea()
    }
}

@available(iOS 14.0.0, *)
#Preview {
    ViewWithColor(color: .red)
}
