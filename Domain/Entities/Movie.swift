//
//  Movie.swift
//  Domain
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

public struct MovieResponse {
    public let movies: [Movie]
    public let page: Int
    public let totalPages: Int
    public let totalMovies: Int
}

extension MovieResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case movies = "results"
        case page
        case totalPages = "total_pages"
        case totalMovies = "total_results"
    }
}

public struct Movie: Decodable {
    public let id: Int
    public let title: String
    public let posterPath: String?
    public let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case rating = "vote_average"
    }
}
