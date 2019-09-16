//
//  NetworkProvider.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain

final class NetworkProvider {
    private let apiEndpoint: String
    private let apiKey: String
    
    public init() {
        apiEndpoint = "https://api.themoviedb.org/3"
        apiKey = "f68fdbc666e9fea225abe7092501d507"
    }
    
    public func makeMoviesNetwork() -> MoviesNetwork {
        let network = Network<MovieResponse>(endPoint: apiEndpoint, apiKey: apiKey)
        return MoviesNetwork(network: network)
    }
    
}

