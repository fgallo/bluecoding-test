//
//  MoviesDatabase.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain
import RxSwift

public final class MoviesDatabase {
    
    private let database: Database<Movie>
    
    init(database: Database<Movie>) {
        self.database = database
    }

    public func fetchMovies() -> Observable<[Movie]> {
        return database.queryAll()
    }
    
    public func saveMovie(_ movie: Movie) -> Observable<Bool> {
        return database.save(entity: movie)
    }
    
}
