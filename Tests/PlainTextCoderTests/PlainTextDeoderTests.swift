import XCTest
import PlainTextCoder

final class PlainTextDeoderTests: XCTestCase {
  
  
  
  func testSingleValue() {
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
  
  static var allTests = [
    ("testExample", testSingleValue),
  ]
}
