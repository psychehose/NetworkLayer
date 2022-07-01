//
//  BaseErrorResponseDTO.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

public struct BaseErrorResponseDTO: Decodable {
  public let status: Int
  public let message: String
  public let name: String
}

public struct ErrorStruct: Decodable {
  public let status: Int
  public let message: String
  public let name: String
}
