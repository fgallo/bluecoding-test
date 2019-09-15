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
}

class DefaultMoviesRouter: MoviesRouter {
    private let navigationController: UINavigationController
    private let storyboard: UIStoryboard
    
    init(navigationController: UINavigationController,
         storyboard: UIStoryboard) {
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func toMovies() {
        let moviesViewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
        moviesViewController.viewModel = MoviesViewModel()
        navigationController.pushViewController(moviesViewController, animated: true)
    }
    
}
