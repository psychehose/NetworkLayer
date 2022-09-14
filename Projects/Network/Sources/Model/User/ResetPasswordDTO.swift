//
//  ResetPasswordDTO.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

public struct ResetPasswordRequestDTO: Encodable {

  public let secretKey: String
  public let password: String

  enum CodingKeys: String, CodingKey {
    case secretKey
    case password = "newPassword"
  }
  public init(secretKey: String, password: String) {
    self.secretKey = secretKey
    self.password = password
  }

}
