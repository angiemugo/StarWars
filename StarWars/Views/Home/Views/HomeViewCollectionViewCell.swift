//
//  HomeViewCollectionViewCell.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class HomeViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var itemImage: UIImageView!

    func configureCell(_ model: UIModel) {
        itemImage.image = model.image
        itemLabel.text = model.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
    }
}

extension HomeViewCollectionViewCell {
    struct UIModel {
        let title: String
        let image: UIImage
    }
}

