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
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 90, height: 90)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeViewCollectionViewCell.self, forCellWithReuseIdentifier: HomeViewCollectionViewCell.identifier)
        collectionView.tag = 1
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    let homeViewModel: HomeViewModel
    
    init(_ homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = collectionView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getModels()
        configureCollectionView()
    }
    
    private func configureView() {
        collectionView.backgroundColor = UIColor.systemBlue
        configureNavigationBar("Home")
    }
    
    private func configureCollectionView() {
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
