//
//  MovieDetailsViewController.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 16/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Domain
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    private let disposeBag = DisposeBag()
    var viewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = MovieDetailsViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.rating
            .drive(ratingLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.overview
            .drive(overviewTextView.rx.text)
            .disposed(by: disposeBag)
        
        output.posterURL
            .drive(onNext: { url in
                if let url = url {
                    self.movieImageView.af_setImage(
                        withURL: url,
                        imageTransition: .crossDissolve(0.2)
                    )
                }
            })
            .disposed(by: disposeBag)
    }

}
