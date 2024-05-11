import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    
    func testAgePrediction() throws {
        Networking.shared.agePrediction(by: "Neil") { data, error in
            XCTAssertEqual(error != nil, true, "Something went wrong")
        }
    }
    
    func testInterestingFact() throws {
        Networking.shared.interestingFact(by: 73) { data, error in
            XCTAssertEqual(error != nil, true, "Something went wrong")
        }
    }
}
