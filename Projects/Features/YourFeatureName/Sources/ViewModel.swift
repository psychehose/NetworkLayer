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
//    let didTapButton: Observable<Bool>
    let didTapButton: Observable<Void>
  }

  func transform(input: Input) -> Output {

    let didTapButton = input.tapButton
      .flatMapLatest {
        self.request()
      }
      .map { () }
//      .compactMap { $0.result }
//      .filter { $0 }
      .asObservable()
//    return Output(didTapButton: didTapButton)
    return Output(didTapButton: didTapButton)
  }

  private func request<T: Decodable>() -> Observable<NetworkResult<T, BaseErrorResponseDTO, NSError>> {
    Observable<NetworkResult>.create { [weak self] observer in

      NetworkService.shared.userService.resetPassword(
        resetPasswordRequestDTO: ResetPasswordRequestDTO(
          secretKey: "asf324gfdsgdgdfgfdgbbdffdf",
          password: "Qwerqq11!!"
        ),
        userIndex: 11
      ) { result in

        if let result = result {
          switch result {



            
            



//            observer.on(.next(result))
//            observer.on(.next(.success(<#T##Decodable#>)))
            observer.on(.next(<#T##NetworkResult<Decodable, BaseErrorResponseDTO, NSError>#>))

            res.result

            observer.on(.next(result))

            
            var r = res
            print(res)

            res.result

          case .handlingError(let baseErrorResponseDTO):
            print("baseErrorResponseDTO\(baseErrorResponseDTO)")
//            baseErrorResponseDTO.messa


            baseErrorResponseDTO.message
//            observer.on(.next(result as! NetworkResult<T>))

          case .unhandlingError(let err):
            observer.on(.error(err))
            print("err입니다. \(err)")
          }
        }

//        if let result = result {
//          switch result {
//          case .success(<#T##BaseResponseDTO<Bool>#>)
//          case .handlingError(<#T##BaseErrorResponseDTO#>)
//          case .unhandlingError(<#T##NSError#>)
//          }
//        }


//        if let result = result {
//          switch result {
//          case .success(let res):
////            single(.success(res))
//            observer.on(.next(result)
//
////          case .handlingError(let res):
////                          observer.on(<#T##event: Event<NetworkResult<Decodable>>##Event<NetworkResult<Decodable>>#>)
////            single(.success(res))
//
////          case .unhandlingError(let err):
////            single(.failure(err))
//          }
//        }

      }

      return Disposables.create()
    }
  }
}

