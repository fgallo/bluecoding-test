//
//  MoviesRouter.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import Domain

protocol MoviesRouter {
    func toMovies()
    func toMovieDetails(_ movie: Movie)
}

class DefaultMoviesRouter: MoviesRouter {
    private let services: UseCaseProvider
    private let navigationController: UINavigationController
    private let storyboard: UIStoryboard
    
    init(services: UseCaseProvider,
         navigationController: UINavigationController,
         storyboard: UIStoryboard) {
        self.services = services
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func toMovies() {
        let moviesViewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
        moviesViewController.title = "Movies"
        moviesViewController.viewModel = MoviesViewModel(useCase: services.makeMoviesUseCase(), router: self)
        navigationController.pushViewController(moviesViewController, animated: true)
    }
    
    func toMovieDetails(_ movie: Movie) {
        let movieDetailsRouter = DefaultMovieDetailsRouter(navigationController: navigationController)
        let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        movieDetailsViewController.viewModel = MovieDetailsViewModel(movie: movie, router: movieDetailsRouter)
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }
    
}
