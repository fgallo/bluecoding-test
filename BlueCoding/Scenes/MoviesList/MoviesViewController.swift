//
//  MoviesViewController.swift
//  BlueCoding
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    private let collectionViewPadding: CGFloat = 16.0
    var viewModel: MoviesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModel()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.refreshControl = UIRefreshControl()
        collectionView.register(UINib(nibName: String(describing: MovieCollectionViewCell.self), bundle: nil),
                                forCellWithReuseIdentifier: MovieCollectionViewCell.cellIdentifier)
    }
    
    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let pull = collectionView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = MoviesViewModel.Input(trigger: Driver.merge(viewWillAppear, pull))
        let output = viewModel.transform(input: input)
        
        output.movies.drive(collectionView.rx.items(cellIdentifier: MovieCollectionViewCell.cellIdentifier,
                                                    cellType: MovieCollectionViewCell.self)) { collectionView, viewModel, cell in
                                                        cell.bind(viewModel)
            }.disposed(by: disposeBag)
        
        output.fetching
            .drive(collectionView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
    }
    
}


extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: collectionViewPadding,
                            left: collectionViewPadding,
                            bottom: collectionViewPadding,
                            right: collectionViewPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.size.width - (collectionViewPadding *  3)
        let width = collectionViewWidth / 2
        let height = width * 1.85
        
        return CGSize(width: width, height: height)
    }
    
}
