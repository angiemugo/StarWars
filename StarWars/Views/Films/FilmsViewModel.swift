//
//  FilmsViewModel.swift .swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import RxSwift
import RxCocoa
import StarWarsPackage

class FilmsViewModel {
    let films = BehaviorRelay(value: [FilmViewCell.UIModel]())
    let disposeBag = DisposeBag()
    
    func fetchFilms() {
        RemoteDataSource.shared.starWarsFilms().subscribe { [weak self] (films) in
            guard let self = self else { return }
            let films = films.map { films in
                return self.getUIModel(films.title,
                                       films.openingCrawl,
                                       films.releaseYear)
            }
            self.films.accept(films)
        } onFailure: { error in
            print("This is the error: \(error)")
        }.disposed(by: disposeBag)
    }
    
    func getUIModel(_ title: String, _ openingCrawl: String, _ releaseDate: String) -> FilmViewCell.UIModel {
        let filmsUIModel = FilmViewCell.UIModel(title: title,
                                                openingCrawl: openingCrawl,
                                                releaseYear: releaseDate)
        return filmsUIModel
    }
}
