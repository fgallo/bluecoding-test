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
    
    public func movies() -> Observable<[Movie]> {
        return Observable.empty()
    }
    
}
