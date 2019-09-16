//
//  MovieDetailsViewModel.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 16/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

class MovieDetailsViewModel: ViewModelType {
    
    struct Input {
    }
    
    struct Output {
        let title: Driver<String>
        let rating: Driver<String>
        let overview: Driver<String>
        let posterURL: Driver<URL?>
    }
    
    private let movie: Movie
    private let router: MovieDetailsRouter
    
    init(movie: Movie, router: MovieDetailsRouter) {
        self.movie = movie
        self.router = router
    }
    
    func transform(input: Input) -> Output {
        let title = Observable.just(movie.title).asDriverOnErrorJustComplete()
        let rating = Observable.just("\(movie.rating) / 10.0").asDriverOnErrorJustComplete()
        let overview = Observable.just(movie.overview).asDriverOnErrorJustComplete()
        let posterURL = Observable.just(URL(string: "https://image.tmdb.org/t/p/original" + (movie.posterPath ?? ""))).asDriverOnErrorJustComplete()
        return Output(title: title, rating: rating, overview: overview, posterURL: posterURL)
    }
    
}
