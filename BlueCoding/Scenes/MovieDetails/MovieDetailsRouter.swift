//
//  MovieDetailsRouter.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 16/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import Domain

protocol MovieDetailsRouter {
    func toMovies()
}

class DefaultMovieDetailsRouter: MovieDetailsRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMovies() {
        navigationController.popViewController(animated: true)
    }
}
