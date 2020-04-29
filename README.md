# PlainTextCoder

![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg) 
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://github.com/apple/swift-package-manager)


## Decoder
```swift
struct Decoded: Decodable {
  var text:String
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    text = try container.decode(String.self)
  }
}
let resource = "Some text"
let decoder = PlainTextDecoder(resource)
let decoded = try? Decoded(from: decoder)
```
## Encoder
```swift
struct TEXT:Encodable {
   var message:String
   func encode(to encoder: Encoder) throws {
     var svc = encoder.singleValueContainer()
     try svc.encode(message)
   }
 }
let text = TEXT(message: "some text")
let encoder = PlainTextEncoder()
try! text.encode(to: encoder)
let encodedText = encoder.text
let encodedData = encoder.data
```
## Author

twitter : [@YuTsungYu](https://twitter.com/YuTsungYu) 

## License

MyLibrary is available under the MIT license. See the LICENSE file for more info.
