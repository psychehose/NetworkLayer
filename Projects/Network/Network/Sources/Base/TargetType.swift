//
//  TargetType.swift
//  NetworkKit
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.devhose. All rights reserved.
//

import Foundation
import Alamofire

public protocol TargetType: URLRequestConvertible {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: RequestParams { get }
}

enum HTTPHeaderField: String {
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
}

enum ContentType: String {
  case json = "Application/json"
}

public enum RequestParams {
  case requestPlain
  case query(_ parameter: Encodable?)
  case body(_ parameter: Encodable?)
}

extension TargetType {

  public func asURLRequest() throws -> URLRequest {

    let url = try baseURL.asURL()

    var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

    switch parameters {

    case .query(let request):
      let params = request?.toDictionary() ?? [:]
      let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
      var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)

      components?.queryItems = queryParams
      urlRequest.url = components?.url

    case .body(let request):
      let params = request?.toDictionary() ?? [:]
      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])

    case .requestPlain:
      break
    }

    return urlRequest
  }
}
