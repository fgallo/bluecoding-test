//
//  MovieCollectionViewCell.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let cellIdentifier = "MovieCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        movieImageView.layer.cornerRadius = 4.0
        movieImageView.clipsToBounds = true
        movieImageView.backgroundColor = .lightGray
    }
    
    func bind(_ viewModel: MovieCellViewModel) {
        self.titleLabel.text = viewModel.title
        self.ratingLabel.text = viewModel.rating
        
        if let url = viewModel.posterURL {
            self.movieImageView.af_setImage(
                withURL: url,
                imageTransition: .crossDissolve(0.2)
            )
        }
    }

}
