//
//  MovieCellViewModel.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Domain

struct MovieCellViewModel {
    let title: String
    let rating: String
    let posterURL: URL?
    let movie: Movie
    
    init(movie: Movie) {
        self.title = movie.title
        self.rating = "\(movie.rating) / 10.0"
        self.posterURL = URL(string: "https://image.tmdb.org/t/p/original" + (movie.posterPath ?? ""))
        self.movie = movie
    }
}
