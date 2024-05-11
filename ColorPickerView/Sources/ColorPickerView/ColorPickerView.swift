// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0, *)
public struct ColorPickerView: View {
    
    @State private var selectedColor: Color
    
    public init() {
        self.selectedColor = Color.red
    }
    
    public var body: some View {
        VStack {
            Circle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                .padding()
            ColorPicker("Select a color", selection: $selectedColor)
                .font(.headline)
                .padding()
        }
        .padding()
    }
}

@available(iOS 14.0, *)
#Preview {
    ColorPickerView()
}
