//
//  UserService.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//
import Foundation

import Alamofire

public enum UserService {
  case resetPassword(ResetPasswordRequestDTO, userIndex: Int)
}

extension UserService: TargetType {
  public var baseURL: String {
    return "https://"
  }

  public var path: String {
    switch self {
    case .resetPassword(_, let userIndex):
      return "/user//\(userIndex)"
    }
  }

  public var method: HTTPMethod {
    switch self {
    case .resetPassword:
      return .put
    }
  }

  public var parameters: RequestParams {
    switch self {
    case .resetPassword(let dto, _):
      return .body(dto)
    }
  }
}
