//
//  UseCaseProvider.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }

    public func makeMoviesUseCase() -> Domain.MoviesUseCase {
        return MoviesDataRepository(network: networkProvider.makeMoviesNetwork())
    }
    
}
