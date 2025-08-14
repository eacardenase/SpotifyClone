//
//  HomeController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Properties

    lazy var menuBar = {
        let _menuBar = MenuBar()

        _menuBar.delegate = self

        return _menuBar
    }()


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

        // menuBar
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            menuBar.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            menuBar.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
        ])
    }

}

// MARK: - MenuBarDelegate

extension HomeController: MenuBarDelegate {

    func buttonTapped(_ sender: UIButton) {
        menuBar.selectItem(at: sender.tag)
    }

}
