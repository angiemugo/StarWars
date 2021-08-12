//
//  PlanetsViewModel.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import RxCocoa
import RxSwift
import StarWarsPackage

class PlanetsViewModel {
    let planets = BehaviorRelay(value: [PlanetsViewCell.UIModel]())
    let disposeBag = DisposeBag()
    
    func fetchPlanets() {
        RemoteDataSource.shared.starWarsPlanets().subscribe { [weak self] planets in
            guard let self = self else { return }
            let planets = planets.map { planet in
                return self.getUIModel(planet.title, planet.population, planet.climate)
            }
            self.planets.accept(planets)
        } onFailure: { error in
            print("This is the error: \(error)")
        }.disposed(by: disposeBag)
    }
    
    func getUIModel(_ name: String, _ population: String, _ climate: String) -> PlanetsViewCell.UIModel {
        let planetsUIModel = PlanetsViewCell.UIModel(title: name,
                                                     population: population,
                                                     climate: climate)
        return planetsUIModel
    }
}
