//
//  PeopleViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PeopleViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    let viewModel: PeopleViewModel
    
    init(_ viewModel: PeopleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.peopleViewController.rawValue, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        viewModel.fetchPeople()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: PeopleViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: PeopleViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        
        viewModel.people.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: PeopleViewCell.identifier,
                              cellType: PeopleViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
    }
}
