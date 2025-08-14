//
//  MenuBar.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

protocol MenuBarDelegate: AnyObject {

    func buttonTapped(_ sender: UIButton)

}

class MenuBar: UIView {

    // MARK: - Properties

    weak var delegate: MenuBarDelegate?

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

        let stackView = UIStackView(arrangedSubviews: [
            playlistsButton,
            artistsButton,
            albumsButton,
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 36

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
        ])
    }

    func selectItem(at index: Int) {
        let button: UIButton

        switch index {
        case 0:
            button = playlistsButton
        case 1:
            button = artistsButton
        case 2:
            button = albumsButton
        default:
            button = playlistsButton
        }

        UIView.animate(withDuration: 0.3) {
            self.setAlpha(for: button)
        }
    }

    private func setAlpha(for button: UIButton) {
        playlistsButton.alpha = 0.5
        artistsButton.alpha = 0.5
        albumsButton.alpha = 0.5

        button.alpha = 1
    }

}

// MARK: - Actions

extension MenuBar {

    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(sender)
    }

}
