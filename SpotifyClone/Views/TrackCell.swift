//
//  TrackCell.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/18/25.
//

import UIKit

class TrackCell: UITableViewCell {

    // MARK: Properties

    var trackImageView: UIImageView = {
        let _imageView = UIImageView()

        _imageView.translatesAutoresizingMaskIntoConstraints = false
        _imageView.contentMode = .scaleAspectFit
        _imageView.layer.masksToBounds = true

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
        label.textColor = .white

        return label
    }()

    var subtitleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .white.withAlphaComponent(0.7)

        return label
    }()

    var track: Track? {
        didSet {
            guard let track else { return }

            let image =
                UIImage(named: track.imageName) ?? UIImage(named: "placeholder")

            trackImageView.image = image
            titleLabel.text = track.title
            subtitleLabel.text = track.artist
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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

        contentView.addSubview(trackImageView)
        contentView.addSubview(stackView)

        // imageView
        NSLayoutConstraint.activate([
            trackImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 8
            ),
            trackImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            trackImageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -8
            ),
            trackImageView.widthAnchor.constraint(
                equalTo: trackImageView.heightAnchor
            ),
            trackImageView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
        ])

        let trackImageViewHeigthConstraint = trackImageView.heightAnchor
            .constraint(equalToConstant: 72)
        trackImageViewHeigthConstraint.priority = UILayoutPriority(900)
        trackImageViewHeigthConstraint.isActive = true

        // stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: trackImageView.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: trackImageView.trailingAnchor,
                constant: 16
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 24
            ),
        ])
    }

}
