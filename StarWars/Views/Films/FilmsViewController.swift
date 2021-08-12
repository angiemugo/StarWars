//
//  FilmsViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class FilmsViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    let viewModel: FilmsViewModel
    
    init(_ viewModel: FilmsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.filmsViewController.rawValue, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        viewModel.fetchFilms()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: FilmViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: FilmViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        viewModel.films.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: FilmViewCell.identifier,
                              cellType: FilmViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
