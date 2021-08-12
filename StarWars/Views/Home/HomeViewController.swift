//
//  HomeViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let homeViewModel: HomeViewModel
    
    init(_ homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: ControllerIds.homeViewController.rawValue, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getModels()
        configureCollectionView()
    }
    
    func configureView() {
        collectionView.backgroundColor = UIColor.systemBlue
        configureNavigationBar("Home")
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: HomeViewCollectionViewCell.identifier,
                                      bundle: nil), forCellWithReuseIdentifier: HomeViewCollectionViewCell.identifier)
        homeViewModel.serviceDataSource.asObservable()
            .bind(to: collectionView
                    .rx.items(cellIdentifier: HomeViewCollectionViewCell.identifier,
                              cellType: HomeViewCollectionViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
        
        collectionView.rx
            .itemSelected
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.homeViewModel.goToService(indexPath.item)
            }).disposed(by: disposeBag)
    }
}
