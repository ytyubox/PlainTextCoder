import Foundation.NSDate
public final class PlainTextEncoder: Encoder {
  public init(encoding: String.Encoding = .utf8) {
    self.encoding = encoding
  }
  
  public var codingPath: [CodingKey] = []
  public var encoding: String.Encoding
  public var userInfo: [CodingUserInfoKey : Any] = [:]
  public var text = ""
  public var data:Data {text.data(using: encoding)!}
  public func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> {
    fatalError("Plaintext encoding does not support dictionaries.")
  }
  
  public func unkeyedContainer() -> UnkeyedEncodingContainer {
    fatalError("Plaintext encoding does not support arrays.")
  }
  
  /// plain text data
  public func singleValueContainer() -> SingleValueEncodingContainer {
    SVEC(self)
  }
  
}

fileprivate struct SVEC: SingleValueEncodingContainer {
  init(_ encoder: PlainTextEncoder) {
    self.encoder = encoder
  }
  
  var encoder:PlainTextEncoder
  var text:String {
    set {
      encoder.text = newValue
    }
    get {
      encoder.text
    }
  }
  var codingPath: [CodingKey] = []
  mutating func encodeNil() throws {
    text = ""
  }
  
  
  mutating func encode<T>(_ value: T) throws where T : Encodable {
    text = "\(value)"
  }
  
  
}
