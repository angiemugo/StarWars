//
//  PlanetsViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PlanetsViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    let viewModel: PlanetsViewModel
    
    init(_ viewModel: PlanetsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.planetsViewController.rawValue, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        viewModel.fetchPlanets()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: PlanetsViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: PlanetsViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        viewModel.planets.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: PlanetsViewCell.identifier,
                              cellType: PlanetsViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
    }
}
