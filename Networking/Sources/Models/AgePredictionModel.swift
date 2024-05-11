//
//  AgePredictionModel.swift
//
//
//  Created by Bohdan Hawrylyshyn on 11.05.24.
//

import Foundation

public struct AgePredictionModel: Codable {
    public let name: String
    public let age: Int
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
