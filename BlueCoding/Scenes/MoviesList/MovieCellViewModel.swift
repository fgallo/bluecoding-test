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
    
    init(movie: Movie) {
        self.title = movie.title
        self.rating = "\(movie.rating) / 10.0"
        self.posterURL = URL(string: movie.posterPath ?? "")
    }
}
