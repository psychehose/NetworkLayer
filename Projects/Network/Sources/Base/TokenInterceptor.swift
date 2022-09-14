//
//  TokenInterceptor.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation
import Alamofire

final class TokenInterceptor: RequestInterceptor {
  func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
    var urlRequest = urlRequest
//    urlRequest.setValue("Bearer \(KeychainHandler.shared.getAccessToken() ?? "")", forHTTPHeaderField: "Authorization")
    completion(.success(urlRequest))
  }

  func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
    guard
      let response = request.task?.response as? HTTPURLResponse,
      response.statusCode == 401
    else {
      return
    }

//    let verifyRefreshToeknRequestDTO = VerifyRefreshToeknRequestDTO(
//      userDeviceID: KeychainHandler.shared.getDeviceToekn() ?? "",
//      fcmDeviceToken: KeychainHandler.shared.getFCMToken() ?? "",
//      refreshToken: KeychainHandler.shared.getRefreshToken()
//    )
//
//    NetworkService.shared.loginService.verifyRefreshToken(
//      verifyRefreshToeknRequestDTO: verifyRefreshToeknRequestDTO) { (res, err) in
//        if let err = err {
//          let errCode = NSError(domain: err.name, code: err.status)
//          completion(.doNotRetryWithError(errCode))
//        }
//        if let res = res {
//          KeychainHandler.shared.setAccessToken(accessToken: res.result?.accessToken)
//          KeychainHandler.shared.setRefreshToken(refreshToken: res.result?.refreshToken)
//          completion(.retry)
//        }
//      }
  }
}
