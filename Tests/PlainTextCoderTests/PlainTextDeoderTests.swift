import XCTest
import PlainTextCoder

final class PlainTextDeoderTests: XCTestCase {
  
  func testSingleValueString() {
    struct Decoded: Decodable {
      var text:String
      init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        text = try container.decode(String.self)
      }
    }
    let resource = "Some text"
    let decoder = PlainTextDecoder(resource)
    let decoded = try? Decoded.init(from: decoder)
    XCTAssertNotNil(decoded)
    XCTAssertEqual(decoded?.text, resource)
  }
  func testSingleValueBool() {
    struct Decoded: Decodable {
      var bool: Bool
      init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        bool = try container.decode(Bool.self)
      }
    }
    do {
      let resource = "true"
      let decoder = PlainTextDecoder(resource)
      let decoded = try? Decoded.init(from: decoder)
      XCTAssertNotNil(decoded)
      XCTAssertEqual(decoded?.bool.description, resource)
    }
    do {
         let resource = "true"
         let decoder = PlainTextDecoder(resource)
         let decoded = try? Decoded.init(from: decoder)
         XCTAssertNotNil(decoded)
         XCTAssertEqual(decoded?.bool.description, resource)
       }
    do {
         let resource = "notBool"
         let decoder = PlainTextDecoder(resource)
      XCTAssertThrowsError(try Decoded.init(from: decoder)) { e in
        let decodingError = e as! DecodingError
        switch decodingError {
          case .dataCorrupted(let v): XCTAssertEqual(v.debugDescription, #"text: "notBool" is not a Bool"#)
          default: XCTFail("Wrong Error reason")
        }
      }
         
         
       }
  }
  
  static var allTests = [
    ("testExample", testSingleValueString),
  ]
}
