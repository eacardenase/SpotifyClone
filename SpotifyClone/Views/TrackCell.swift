//
//  TrackCell.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/18/25.
//

import UIKit

class TrackCell: UICollectionViewCell {

    var imageView: UIImageView = {
        let _imageView = UIImageView()

        _imageView.translatesAutoresizingMaskIntoConstraints = false

        return _imageView
    }()

    var titleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .body,
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Could not create font descriptor with traits.")
        }

        label.font = UIFont(descriptor: fontDescriptor, size: 0)

        return label
    }()

    var subtitleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.alpha = 0.7

        return label
    }()

    var track: Track? {
        didSet {
            guard let track else { return }

            let image =
                UIImage(named: track.imageName) ?? UIImage(named: "placeholder")

            imageView.image = image
            titleLabel.text = track.title
            subtitleLabel.text = track.artist
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers

extension TrackCell {

    private func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel, subtitleLabel,
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 6

        contentView.addSubview(imageView)
        contentView.addSubview(stackView)

        // imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            imageView.heightAnchor.constraint(equalToConstant: 76),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
        ])

        // stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: imageView.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: 16
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 24
            ),
        ])
    }

}
