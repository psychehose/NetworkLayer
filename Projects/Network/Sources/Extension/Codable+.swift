//
//  Codable+.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

extension Encodable {
  func toDictionary() -> [String: Any] {
    guard
      let data = try? JSONEncoder().encode(self),
      let jsonData = try? JSONSerialization.jsonObject(with: data),
      let dictionaryData = jsonData as? [String: Any] else { return [:] }
    return dictionaryData
  }
}
