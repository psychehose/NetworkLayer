//
//  UserAPI.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation

protocol UserAPIProtocol {
  func resetPassword(
    resetPasswordRequestDTO: ResetPasswordRequestDTO,
    userIndex: Int,
    completion: @escaping((NetworkResult<BaseResponseDTO<Bool>>)?) -> Void
  )
}

final public class UserAPI: BaseAPI<UserService>, UserAPIProtocol {
  public func resetPassword(
    resetPasswordRequestDTO: ResetPasswordRequestDTO,
    userIndex: Int,
    completion: @escaping ((NetworkResult<BaseResponseDTO<Bool>>)?) -> Void
  ) {
    fetchData(
      target: .resetPassword(resetPasswordRequestDTO, userIndex: userIndex),
      responseData: BaseResponseDTO<Bool>.self) { result in
        completion(result)
      }
  }
}
