//
//  HomeViewModel.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import RxSwift
import RxCocoa

class HomeViewModel {
    private var coordinator: HomeCoordinator?
    let serviceDataSource = BehaviorRelay(value: [HomeViewCollectionViewCell.UIModel]())
    
    func setCoordinator(_ coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func getModels() {
        let models = [HomeViewCollectionViewCell.UIModel(title: "People", image: #imageLiteral(resourceName: "people")),
                      HomeViewCollectionViewCell.UIModel(title: "Planets", image: #imageLiteral(resourceName: "planets")),
                      HomeViewCollectionViewCell.UIModel(title: "Films", image: #imageLiteral(resourceName: "films"))]
        serviceDataSource.accept(models)
    }
    
    func goToService(_ item: Int) {
        switch item {
        case 0:
            coordinator?.goToPeople()
        case 1:
            coordinator?.goToPlanets()
        case 2:
            coordinator?.goToFilms()
        default:
            break
        }
    }
}
