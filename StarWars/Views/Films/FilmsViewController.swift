//
//  FilmsViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class FilmsViewController: BaseViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.sectionHeaderHeight = 40
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FilmViewCell.self, forCellReuseIdentifier: FilmViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
        return tableView
    }()
    
    let filmsViewModel: FilmsViewModel

    init(_ filmsViewModel: FilmsViewModel) {
        self.filmsViewModel = filmsViewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        filmsViewModel.fetchFilms()
        configureTableView()
    }
    
    private func configureTableView() {
        filmsViewModel.films.asObservable()
            .bind(to: tableView
                    .rx.items(cellIdentifier: FilmViewCell.identifier,
                              cellType: FilmViewCell.self)) { _, model, cell in
                cell.configureCell(model)
            }.disposed(by: disposeBag)
        filmsViewModel.error.subscribe(onNext: { [weak self] error in
            guard let self = self else { return }
            self.showErrorAlert("Error", error) { action in
                self.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: disposeBag)
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
