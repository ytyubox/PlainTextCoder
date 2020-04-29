import XCTest
import PlainTextCoder

final class PlainTextEncoderTests: XCTestCase {
  struct TEXT:Encodable {
    init(_ message: String) {
      self.message = message
    }
    
    var message:String
    func encode(to encoder: Encoder) throws {
      var svc = encoder.singleValueContainer()
      try svc.encode(message)
    }
  }
  func testPlainTextEncode() {
    let text = TEXT("some text")
    let encoder = PlainTextEncoder()
    try! text.encode(to: encoder)
    XCTAssertEqual(encoder.text, text.message)
    XCTAssertEqual(encoder.data, text.message.data(using: .utf8))
  }
}
