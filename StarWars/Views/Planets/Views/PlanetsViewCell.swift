//
//  PlanetsViewCell.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class PlanetsViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var populationLabel: UILabel!
    @IBOutlet private var climateLabel: UILabel!

    func configureCell(_ model: UIModel) {
        titleLabel.text = "Planet: \(model.title)"
        populationLabel.text = model.population
        climateLabel.text = model.climate
    }
}

extension PlanetsViewCell {
    struct UIModel {
        let title: String
        let population: String
        let climate: String
    }
}
