//
//  BaseResponseDTO.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

public struct BaseResponseDTO<T: Decodable>: Decodable {
  public let result: T?
}
