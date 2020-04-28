


public final class PlainTextDecoder:Decoder {
  public init(_ text: String) {
    self.text = text
  }
  
  let text: String
  
  public var codingPath: [CodingKey] = [ ]
  
  public var userInfo: [CodingUserInfoKey : Any] =  [:]
  
  public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
    fatalError()
  }
  
  public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
    fatalError()
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
    try Bool(text).tryNil {
      DecodingError.dataCorruptedError(in: self, debugDescription: #"text: "\#(text)" is not a \#(type)"#)
    }
  }
  
  func decode(_ type: String.Type) throws -> String {
    return text
  }
  
  func decode(_ type: Double.Type) throws -> Double {
    try Double(text).tryNil {
        DecodingError.dataCorruptedError(in: self, debugDescription: #"text: "\#(text)" is not a \#(type)"#)
      }
  }
  
  func decode(_ type: Float.Type) throws -> Float {
 fatalError()
  }
  
  func decode(_ type: Int.Type) throws -> Int {
 fatalError()
  }
  
  func decode(_ type: Int8.Type) throws -> Int8 {
 fatalError()
  }
  
  func decode(_ type: Int16.Type) throws -> Int16 {
 fatalError()
  }
  
  func decode(_ type: Int32.Type) throws -> Int32 {
 fatalError()
  }
  
  func decode(_ type: Int64.Type) throws -> Int64 {
 fatalError()
  }
  
  func decode(_ type: UInt.Type) throws -> UInt {
 fatalError()
  }
  
  func decode(_ type: UInt8.Type) throws -> UInt8 {
 fatalError()
  }
  
  func decode(_ type: UInt16.Type) throws -> UInt16 {
 fatalError()
  }
  
  func decode(_ type: UInt32.Type) throws -> UInt32 {
 fatalError()
  }
  
  func decode(_ type: UInt64.Type) throws -> UInt64 {
 fatalError()
  }
  
  func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
 fatalError()
  }
  
    var codingPath: [CodingKey] = []
    
 
}
