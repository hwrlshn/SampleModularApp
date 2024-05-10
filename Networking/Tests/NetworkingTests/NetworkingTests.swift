import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    
    func testAgePrediction() throws {
        Networking.shared.agePrediction(by: "Neil") { data, error in
            XCTAssertEqual(error != nil, true, "Something went wrong")
        }
    }
}
