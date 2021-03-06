public final class PlainTextDecoder:Decoder {
  public init(_ text: String) {
    self.text = text
  }
  
  let text: String
  
  public var codingPath: [CodingKey] = [ ]
  
  public var userInfo: [CodingUserInfoKey : Any] =  [:]
  
  public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
    fatalError("Plaintext decoding does not support dictionaries.")
  }
  
  public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
    fatalError("Plaintext decoding does not support arrays.")
  }
  
  public func singleValueContainer() throws -> SingleValueDecodingContainer {
    SVDC(text: text)
  }
}


fileprivate
struct SVDC: SingleValueDecodingContainer {
  internal init(text: String) {
    self.text = text
  }
  
  let text:String
  func decodeNil() -> Bool {
    text.isEmpty
  }
  
  func decode(_ type: Bool.Type) throws -> Bool {
    try Bool(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: String.Type) throws -> String {
    return text
  }
  
  fileprivate func makeError<T>(_ type: T.Type) -> DecodingError {
    return DecodingError.dataCorruptedError(in: self, debugDescription: #"text: "\#(text)" is not a \#(type)"#)
  }
  
  func decode(_ type: Double.Type) throws -> Double {
    try Double(text).tryNil {
      makeError(type)
    }
  }
  
  func decode(_ type: Float.Type) throws -> Float {
    try Float(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: Int.Type) throws -> Int {
    try Int(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: Int8.Type) throws -> Int8 {
    try Int8(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: Int16.Type) throws -> Int16 {
    try Int16(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: Int32.Type) throws -> Int32 {
    try Int32(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: Int64.Type) throws -> Int64 {
    try Int64(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: UInt.Type) throws -> UInt {
    try UInt(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: UInt8.Type) throws -> UInt8 {
    try UInt8(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: UInt16.Type) throws -> UInt16 {
    try UInt16(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: UInt32.Type) throws -> UInt32 {
    try UInt32(text).tryNil { makeError(type) }
  }
  
  func decode(_ type: UInt64.Type) throws -> UInt64 {
    try UInt64(text).tryNil { makeError(type) }
  }
  
  func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
    throw DecodingError
      .typeMismatch(type,
                    DecodingError
                      .Context(codingPath: [],
                               debugDescription: "PlainTextDecoder is not support nested type, please consider using `init(string:String)`"))
  }
  
  var codingPath: [CodingKey] = []
}
