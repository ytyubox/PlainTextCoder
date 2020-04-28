//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/28.
//

import Foundation

extension Optional {
  func tryNil(_ throwing: () -> Error) throws -> Wrapped {
    guard let w = self else {
      throw throwing()
    }
    return w
  }
}
