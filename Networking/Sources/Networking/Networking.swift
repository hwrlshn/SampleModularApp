// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import AgePredictionModel

final public class Networking {
    
    public static let shared: Networking = .init()
    
    public func agePrediction(
        by name: String,
        completion: @escaping (AgePredictionModel?, Error?) -> Void ) {
            guard let url: URL = .init(string: "https://api.agify.io/?name=\(name)")
            else { return }
            let urlRequest: URLRequest = .init(url: url)
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data,
                      let encodedData = try? JSONDecoder().decode(AgePredictionModel.self, from: data)
                else { return }
                let result: AgePredictionModel = .init(name: encodedData.name, age: encodedData.age)
                completion(result, error)
            }
            .resume()
        }
    
    public func interestingFact(by number: Int, completion: @escaping (String?, Error?) -> Void) {
        guard let url: URL = .init(string: "http://numbersapi.com/\(number)")
        else { return }
        let urlRequest: URLRequest = .init(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data
            else { return }
            let encodedData = String.init(data: data, encoding: .utf8)
            completion(encodedData, error)
        }
        .resume()
    }
    
}
