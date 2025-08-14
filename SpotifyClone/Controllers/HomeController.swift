//
//  HomeController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Properties

    let menuBar = MenuBar()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

// MARK: - Helpers

extension HomeController {

    private func setupViews() {
        view.backgroundColor = .spotifyBlack

        view.addSubview(menuBar)

        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            menuBar.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor
            ),
            menuBar.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            ),
        ])
    }

}
