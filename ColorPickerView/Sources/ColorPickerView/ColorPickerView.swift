// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public protocol ColorPickerDelegate: AnyObject {
    @available(iOS 13.0, *)
    func shareColor(color: Color)
}

@available(iOS 14.0, *)
public struct ColorPickerView: View {
    
    @State private var selectedColor: Color
    
    public weak var delegate: ColorPickerDelegate?
    
    public init(color: Color) {
        self.selectedColor = color
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
        .onChange(of: selectedColor) { color in
            delegate?.shareColor(color: color)
        }
    }
}

@available(iOS 14.0, *)
#Preview {
    ColorPickerView(color: .red)
}
