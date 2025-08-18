//
//  TitleBarViewController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/13/25.
//

import UIKit

class TitleBarViewController: UIViewController {

    // MARK: - Properties

    lazy var musicBarButtonItem: UIBarButtonItem = CustomBarButtonItem(
        title: "Music",
        target: self,
        action: #selector(musicTapped)
    )
    lazy var podcastBarButtonItem: UIBarButtonItem = CustomBarButtonItem(
        title: "Podcast",
        target: self,
        action: #selector(podcastTapped)
    )

    let viewControllers: [UIViewController] = [
        HomeController(),
        HomeController(),
    ]

    lazy var container = ContainerViewController(withPages: viewControllers)

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupViews()
    }

}

// MARK: - Helpers

extension TitleBarViewController {

    private func setupNavBar() {
        navigationItem.leftBarButtonItems = [
            musicBarButtonItem,
            podcastBarButtonItem,
        ]

        updateTitleBar(for: musicBarButtonItem)
    }

    private func setupViews() {
        container.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(container.view)

        NSLayoutConstraint.activate([
            container.view.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            container.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            container.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            container.view.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
    }

    private func updateTitleBar(
        for barItem: UIBarButtonItem
    ) {
        UIView.animate(withDuration: 0.5) {
            self.musicBarButtonItem.customView?.alpha = 0.5
            self.podcastBarButtonItem.customView?.alpha = 0.5

            barItem.customView?.alpha = 1
        }
    }

}

// MARK: - Actions

extension TitleBarViewController {

    @objc func musicTapped(_ sender: UIBarButtonItem) {
        guard let musicViewController = viewControllers.first else {
            return
        }

        container.pageViewController.setViewControllers(
            [
                musicViewController
            ],
            direction: .reverse,
            animated: true
        )

        updateTitleBar(for: musicBarButtonItem)
    }

    @objc func podcastTapped(_ sender: UIBarButtonItem) {
        guard let podcastViewController = viewControllers.last else {
            return
        }

        container.pageViewController.setViewControllers(
            [
                podcastViewController
            ],
            direction: .forward,
            animated: true
        )

        updateTitleBar(for: podcastBarButtonItem)
    }

}
