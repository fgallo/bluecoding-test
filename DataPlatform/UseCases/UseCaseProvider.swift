//
//  UseCaseProvider.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Domain
import Realm
import RealmSwift

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    private let databaseProvider: DatabaseProvider
    
    public init() {
        databaseProvider = DatabaseProvider()
        networkProvider = NetworkProvider()
    }

    public func makeMoviesUseCase() -> Domain.MoviesUseCase {
        return MoviesDataRepository(database: databaseProvider.makeMoviesDatabase(), network: networkProvider.makeMoviesNetwork())
    }
    
}
