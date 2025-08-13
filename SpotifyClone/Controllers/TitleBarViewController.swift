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

    let container = ContainerViewController()

    let viewControllers: [UIViewController] = [
        MusicViewController(),
        PodcastViewController(),
    ]

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
        guard
            let musicViewController = viewControllers.first,
            let podcastViewController = viewControllers.last,
            container.children.first != musicViewController
        else {
            return
        }

        container.addChild(musicViewController)
        container.view.addSubview(musicViewController.view)
        musicViewController.didMove(toParent: container)

        podcastViewController.willMove(toParent: nil)
        podcastViewController.view.removeFromSuperview()
        podcastViewController.removeFromParent()
    }

    @objc func podcastTapped(_ sender: UIBarButtonItem) {
        guard
            let musicViewController = viewControllers.first,
            let podcastViewController = viewControllers.last,
            container.children.first != podcastViewController
        else {
            return
        }

        container.addChild(podcastViewController)
        container.view.addSubview(podcastViewController.view)
        podcastViewController.didMove(toParent: container)

        musicViewController.willMove(toParent: nil)
        musicViewController.view.removeFromSuperview()
        musicViewController.removeFromParent()
    }

}
