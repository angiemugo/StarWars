//
//  HomeViewCollectionViewCell.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit

class HomeViewCollectionViewCell: UICollectionViewCell {
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image  = UIImage(named: "place_holder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private var itemLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    private func setupViews() {
        addSubview(itemImageView)
        addSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemImageView.topAnchor.constraint(equalTo: topAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            itemLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            itemLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 5),
            itemLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }

    func configureCell(_ model: UIModel) {
        itemImageView.image = model.image
        itemLabel.text = model.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
    }
}

extension HomeViewCollectionViewCell {
    struct UIModel {
        let title: String
        let image: UIImage
    }
}
