//
//  MoviesNetwork.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain
import RxSwift

public final class MoviesNetwork {
    private let network: Network<MovieResponse>
    
    init(network: Network<MovieResponse>) {
        self.network = network
    }
    
    public func fetchMovies(releaseYear: Int) -> Observable<MovieResponse> {
        return network.getItem("discover/movie", parameters: ["year": releaseYear])
    }
}
