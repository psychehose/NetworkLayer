//
//  NetworkService.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

final public class NetworkService {
  public static var shared = NetworkService()

  private init() { }

  public let userService = UserAPI()
}
