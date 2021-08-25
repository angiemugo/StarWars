//
//  PlanetsViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PlanetsViewController: BaseViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.sectionHeaderHeight = 40
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlanetsViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        return tableView
    }()

    private let viewModel: PlanetsViewModel
    
    init(_ viewModel: PlanetsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        viewModel.fetchPlanets()
        configureTableView()
    }
    
    private func configureTableView() {
        viewModel.planets.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: PlanetsViewCell.identifier,
                              cellType: PlanetsViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
        viewModel.error.subscribe(onNext: { [weak self] error in
            guard let self = self else { return }
            self.showErrorAlert("Error", error) { action in
                self.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: disposeBag)
    }
}
