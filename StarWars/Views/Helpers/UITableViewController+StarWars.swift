//
//  UITableViewController+StarWars.swift
//  StarWars
//
//  Created by Angie Mugo on 25/08/2021.
//

import UIKit

extension UITableView {
    func register(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
