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
    completion: @escaping(
      (BaseResponseDTO<Bool>?,BaseResponseDTO<BaseErrorResponseDTO>?, Error?)) -> Void
  )
}

final public class UserAPI: BaseAPI<UserService>, UserAPIProtocol {
  public func resetPassword(
    resetPasswordRequestDTO: ResetPasswordRequestDTO,
    userIndex: Int,
    completion: @escaping ((BaseResponseDTO<Bool>?,BaseResponseDTO<BaseErrorResponseDTO>?, Error?)) -> Void
  ) {
    fetchData(
      target: .resetPassword(resetPasswordRequestDTO, userIndex: userIndex),
      responseData: BaseResponseDTO<Bool>.self) { (result,handlingError, error) in
        completion((result, handlingError,error))
      }
  }
}
