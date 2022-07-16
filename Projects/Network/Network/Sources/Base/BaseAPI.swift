//
//  BaseAPI.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Alamofire
import Foundation


public protocol NetworkResultProtocol { }


public class BaseAPI<T: TargetType> {

  let coniguration: URLSessionConfiguration
  let apiLogger = APIEventLogger()
  let tokenInterceptor = TokenInterceptor()
  let session: Session
  let sessionWithInterceptor: Session

  public init(
    configuration: URLSessionConfiguration = .default,
    isLogging: Bool = false
  ) {

    let apiLogger = isLogging ? [APIEventLogger()] : []

    self.coniguration = configuration
    self.session = Session(configuration: configuration, eventMonitors: apiLogger)
    self.sessionWithInterceptor = Session(configuration: configuration, interceptor: tokenInterceptor, eventMonitors: apiLogger)
  } 

  func fetchData<M: Decodable>(target: T, responseData: M.Type, isWithInterceptor: Bool = false, completionHandler: @escaping (M?, BaseResponseDTO<BaseErrorResponseDTO>?, Error?) -> Void) {

    let session = isWithInterceptor ? self.sessionWithInterceptor : self.session

    session.request(target).responseDecodable { (response: DataResponse<M, AFError>) in

      guard let statusCode = response.response?.statusCode else {

        completionHandler(nil, nil, response.error)

        return
      }

      if 200...300 ~= statusCode {

        guard let data = response.data,
              let decodedData = try? JSONDecoder().decode(M.self, from: data)
        else {
          print("Decoding Error")
          return
        }

        completionHandler(decodedData, nil, nil)

      }


      else if statusCode == 400 || statusCode == 404 {
        guard let data = response.data,
              let decodedData = try? JSONDecoder().decode(BaseResponseDTO<BaseErrorResponseDTO>.self, from: data)
        else {
          print("Decoding Error")
          return
        }
        dump(decodedData)

        completionHandler(nil, decodedData, nil)
      }




      else {

        let error = NSError(domain: "Unhandled Error", code: response.response?.statusCode ?? .min)
        print("error statusCode is \(statusCode)")


        completionHandler(nil,nil, error)

      }



    }
  }
}
