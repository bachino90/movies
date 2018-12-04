//
//  NetworkStore.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

internal let networkBackgroundQueue = DispatchQueue(label: "com.baxlabs.rappmovie.NetworkingCompletionQueue", attributes: [])

class BaseStore {

    let manager: Alamofire.SessionManager = Alamofire.SessionManager.default

    func observableRequest<T: ResponseModel>(_ route: RouterRequest) -> Observable<T> {
        return Observable.create { [weak self] observer -> Disposable in

            let request = self?.request(route).response(queue: networkBackgroundQueue) { dataResponse in
//                debugPrint("----------------------------------------------------------------------------")
//                debugPrint("---Request URL: ",dataResponse.request!.url!)
//                debugPrint("---Request Headers URL: ",dataResponse.request!.allHTTPHeaderFields!)
//                debugPrint("---Response URL: ",dataResponse.response!)
//                debugPrint("---Response Headers URL: ",dataResponse.response!.allHeaderFields)
//                debugPrint("----------------------------------------------------------------------------")

                if dataResponse.response?.statusCode == 302 {
                    observer.onError(NetworkError.unauthorize)
                } else if dataResponse.error != nil {
                    observer.onError(NetworkError.network(statusCode: dataResponse.response?.statusCode ?? 500))
                } else {
                    let JSONResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
                    let result = JSONResponseSerializer.serializeResponse(dataResponse.request, dataResponse.response, dataResponse.data, dataResponse.error)
                    if let value = result.value {
                        let json = JSON(value)
                        if let responseObj = T(json) {
                            observer.onNext(responseObj)
                        } else {
                            observer.onError(NetworkError.parsing)
                        }
                    } else {
                        observer.onError(NetworkError.parsing)
                    }
                    observer.onCompleted()
                }
            }
            return Disposables.create { request?.cancel() }
        }
    }

    private func request(_ route: RouterRequest) -> DataRequest {
        var httpHeaders: [String: String] = [:]
        if let headers = route.headers {
            httpHeaders = headers
        }
        return manager.request(route, method: route.method, parameters: route.parameters, encoding: route.encoding, headers: httpHeaders)
    }
}

