//
//  DatabaseProvider.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 16/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain
import Realm
import RealmSwift

final class DatabaseProvider {
    
    public init() {
    }
    
    public func makeMoviesDatabase() -> MoviesDatabase {
        let database = Database<Movie>(configuration: Realm.Configuration())
        return MoviesDatabase(database: database)
    }
    
}
