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

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
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

}

// MARK: - Actions

extension TitleBarViewController {

    @objc func musicTapped(_ sender: UIBarButtonItem) {
        print(#function)
    }

    @objc func podcastTapped(_ sender: UIBarButtonItem) {
        print(#function)
    }

}
