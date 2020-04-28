import XCTest
@testable import PlainTextCoder

final class PlainTextCoderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PlainTextCoder().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
