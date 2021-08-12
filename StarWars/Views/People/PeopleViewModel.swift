//
//  PeopleViewModel.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import Foundation
import RxSwift
import RxCocoa
import StarWarsPackage

class PeopleViewModel {
    let people = BehaviorRelay(value: [PeopleViewCell.UIModel]())
    let disposeBag = DisposeBag()
    
    func fetchPeople() {
        RemoteDataSource.shared.starWarsPeople().subscribe { [weak self] people in
            guard let self = self else { return }
            let people = people.map { person in
                self.getUIModel(person.name, person.eyeColor)
            }
            self.people.accept(people)
        } onFailure: { error in
            print("This is the error: \(error)")
        }.disposed(by: disposeBag)
    }
    
    func getUIModel(_ name: String, _ eyeColor: String) -> PeopleViewCell.UIModel {
        let peopleUIModel = PeopleViewCell.UIModel(name: name,
                                                   eyeColor: eyeColor)
        
        return peopleUIModel
    }
}
