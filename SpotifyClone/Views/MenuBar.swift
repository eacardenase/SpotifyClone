//
//  MenuBar.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

class MenuBar: UIView {

    // MARK: - Properties

    lazy var playlistsButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Playlists", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.tag = 0
        button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )

        return button
    }()

    lazy var artistsButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Artists", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.tag = 1
        button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )

        return button
    }()

    lazy var albumsButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Albums", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.tag = 2
        button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )

        return button
    }()

    lazy var buttons = [
        playlistsButton,
        artistsButton,
        albumsButton,
    ]

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 42)
    }

}

// MARK: - Helpers

extension MenuBar {

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(playlistsButton)
        addSubview(artistsButton)
        addSubview(albumsButton)

        NSLayoutConstraint.activate([
            playlistsButton.topAnchor.constraint(equalTo: topAnchor),
            playlistsButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            artistsButton.topAnchor.constraint(
                equalTo: playlistsButton.topAnchor
            ),
            artistsButton.leadingAnchor.constraint(
                equalTo: playlistsButton.trailingAnchor,
                constant: 36
            ),
            albumsButton.topAnchor.constraint(
                equalTo: playlistsButton.topAnchor
            ),
            albumsButton.leadingAnchor.constraint(
                equalTo: artistsButton.trailingAnchor,
                constant: 36
            ),
        ])
    }

}

// MARK: - Actions

extension MenuBar {

    @objc func buttonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
    }

}
