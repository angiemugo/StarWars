//
//  PeopleViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PeopleViewController: BaseViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.sectionHeaderHeight = 40
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PeopleViewCell.self, forCellReuseIdentifier: PeopleViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        return tableView
    }()
    
    let peopleViewModel: PeopleViewModel

    init(_ peopleViewModel: PeopleViewModel) {
        self.peopleViewModel = peopleViewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func loadView() {
        view = tableView
    }
    
    func setUpView() {
        peopleViewModel.fetchPeople()
        configureTableView()
        configureNavigationBar("StarWars People")
    }
    
    private func configureTableView() {
        peopleViewModel.people.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: PeopleViewCell.identifier,
                              cellType: PeopleViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
        peopleViewModel.error.subscribe(onNext: { [weak self] error in
            guard let self = self else { return }
            self.showErrorAlert("Error", error) { action in
                self.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: disposeBag)
    }
}
