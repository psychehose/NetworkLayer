///
//  ViewModel.swift
//  YourFeatureName
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.jstock. All rights reserved.
//

import NetworkKit
import RxCocoa
import RxSwift

final class ViewModel {
  public struct Input {
    let tapButton: Observable<Void>
  }
  struct Output {
    let didTapButton: Observable<Bool>
  }

  func transform(input: Input) -> Output {

    let didTapButton = input.tapButton
      .flatMapLatest {
        self.request()
      }
      .map { response -> Bool in
          switch response {
          case .Success(let res):
            guard let resVal = res.result else {
              return false
            }

            return resVal
          case .Failure(let handlingError):
            handlingError.result.self
            return false
          }
      }

      .asObservable()
//    return Output(didTapButton: didTapButton)
    return Output(didTapButton: didTapButton)
  }

  private func request() -> Observable<NetworkResult<BaseResponseDTO<Bool>, BaseResponseDTO<BaseErrorResponseDTO>>> {
    Observable<NetworkResult<BaseResponseDTO<Bool>, BaseResponseDTO<BaseErrorResponseDTO>>>.create { [weak self] observer in

      NetworkService.shared.userService.resetPassword(
        resetPasswordRequestDTO: ResetPasswordRequestDTO(
          secretKey: "asf324gfdsgdgdfgfdgbbdffdf",
          password: "Qwerqq11!!"
        ),
        userIndex: 11
      ) { result, handlingError, error in

        if let err = error {

          observer.on(.error(err))
        }
        if let handlingError = handlingError {

          observer.on(.next(NetworkResult.Failure(handlingError)))
        }
        if let res = result {
          observer.on(.next(NetworkResult.Success(res)))
        }
      }

      return Disposables.create()
    }
  }
}

public enum NetworkResult<Value, HandlingError> {
  case Success(Value)
  case Failure(HandlingError)
}
