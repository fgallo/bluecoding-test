//
//  MoviesUseCase.swift
//  Domain
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import RxSwift

public protocol MoviesUseCase {
    func movies(releaseYear: Int) -> Observable<[Movie]>
}
