//
//  MoviesViewModel.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

class MoviesViewModel: ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let movies: Driver<[MovieCellViewModel]>
        let selectedMovie: Driver<Movie>
        let error: Driver<Error>
    }
    
    private let useCase: MoviesUseCase
    private let router: MoviesRouter
    
    init(useCase: MoviesUseCase, router: MoviesRouter) {
        self.useCase = useCase
        self.router = router
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let currentYear = NSCalendar.current.component(.year, from: Date())
        let movies = input.trigger.flatMapLatest { _ in
            return self.useCase.movies(releaseYear: currentYear)
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { $0.map { MovieCellViewModel(movie: $0) } }
        }
        
        let fetching = activityIndicator.asDriver()
        let error = errorTracker.asDriver()
        let selectedMovie = input.selection
            .withLatestFrom(movies) { (indexPath, movies) -> Movie in
                return movies[indexPath.row].movie
            }
            .do(onNext: router.toMovieDetails)
        
        return Output(fetching: fetching,
                      movies: movies,
                      selectedMovie: selectedMovie,
                      error: error)
    }
    
}
