//
//  PeopleViewCell.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PeopleViewCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var eyeColorLabel: UILabel!

    func configureCell(_ model: UIModel) {
        nameLabel.text = "Name: \(model.name)"
        eyeColorLabel.text = "Eye Color: \(model.eyeColor)"
    }
}

extension PeopleViewCell {
    struct UIModel {
        let name: String
        let eyeColor: String
    }
}
