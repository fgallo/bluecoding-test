//
//  MoviesDataRepository.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class MoviesDataRepository: Domain.MoviesUseCase {
    
    private let database: MoviesDatabase
    private let network: MoviesNetwork
    
    init(database: MoviesDatabase, network: MoviesNetwork) {
        self.database = database
        self.network = network
    }
    
    public func movies(releaseYear: Int) -> Observable<[Movie]> {
        let query = database.fetchMovies()
        
        return query.map { !$0.isEmpty }.flatMap({ exists -> Observable<[Movie]> in
            return exists
                ?  query
                : self.network.fetchMovies(releaseYear: releaseYear)
                    .map({ response -> [Movie] in
                        return response.movies
                    })
                    .do(onNext: { movies in
                        for movie in movies {
                            _ = self.database.saveMovie(movie)
                        }
                    })
        })
    }
    
}
