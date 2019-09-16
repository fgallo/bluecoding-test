//
//  Network.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift

final class Network<T: Decodable> {
    
    private let endPoint: String
    private let apiKey: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(endPoint: String, apiKey: String) {
        self.endPoint = endPoint
        self.apiKey = apiKey
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItem(_ path: String, parameters: [String : Any]?) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)"
        var newParameters = parameters ?? [:]
        newParameters["api_key"] = apiKey
        return RxAlamofire
            .data(.get, absolutePath, parameters: newParameters, encoding: URLEncoding.default)
            .debug()
            .observeOn(scheduler)
            .map({ data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            })
    }
    
}
