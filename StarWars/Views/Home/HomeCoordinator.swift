//
//  HomeCoordinator.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class HomeCoordinator {
    let window: UIWindow
    var navController: UINavigationController?
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewModel = HomeViewModel()
        viewModel.setCoordinator(self)
        let viewController = HomeViewController(viewModel)
        let nav = UINavigationController(rootViewController: viewController)
        navController = nav
        window.rootViewController = nav
    }
    
    func goToPlanets() {
        let viewModel = PlanetsViewModel()
        let viewController = PlanetsViewController(viewModel)
        navController?.pushViewController(viewController, animated: true)
    }
    
    func goToFilms() {
        let viewModel = FilmsViewModel()
        let viewController = FilmsViewController(viewModel)
        navController?.pushViewController(viewController, animated: true)
    }
    
    func goToPeople() {
        let viewModel = PeopleViewModel()
        let viewController = PeopleViewController(viewModel)
        navController?.pushViewController(viewController, animated: true)
    }
}
