final class PlainTextDecoder:Decoder {
  var codingPath: [CodingKey] = [ ]
  
  var userInfo: [CodingUserInfoKey : Any] =  [:]
  
  func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
    fatalError()
  }
  
  func unkeyedContainer() throws -> UnkeyedDecodingContainer {
    fatalError()
  }
  
  func singleValueContainer() throws -> SingleValueDecodingContainer {
    fatalError()
  }
  
    
}
