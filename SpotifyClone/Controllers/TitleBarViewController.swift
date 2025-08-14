//
//  TitleBarViewController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/13/25.
//

import UIKit

class MusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
    }

}

class PodcastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
    }

}

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
        MusicViewController(),
        PodcastViewController(),
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
    }

}
