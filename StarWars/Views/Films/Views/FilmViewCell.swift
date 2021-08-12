//
//  FilmViewCell.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class FilmViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var openingCrawlLabel: UILabel!
    
    func configureCell(_ model: UIModel) {
        titleLabel.text = "\(model.title), \(model.releaseYear)"
        openingCrawlLabel.text = model.openingCrawl
    }
}

extension FilmViewCell {
    struct UIModel {
        let title: String
        let openingCrawl: String
        let releaseYear: String
    }
}
