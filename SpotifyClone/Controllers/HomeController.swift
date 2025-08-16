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

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .spotifyBlack
        collection.isPagingEnabled = true
        collection.register(
            PlaylistCell.self,
            forCellWithReuseIdentifier: NSStringFromClass(PlaylistCell.self)
        )

        return collection
    }()

    let colors: [UIColor] = [
        .systemRed,
        .systemGreen,
        .systemBlue,
    ]

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
        view.addSubview(collectionView)

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

        // collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: menuBar.bottomAnchor,
                constant: 16
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
    }

}

// MARK: - UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return colors.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NSStringFromClass(PlaylistCell.self),
                for: indexPath
            ) as? PlaylistCell
        else {
            fatalError("Could not create PlaylistCell")
        }

        cell.backgroundColor = colors[indexPath.item]

        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension HomeController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height
        )
    }

}

// MARK: - MenuBarDelegate

extension HomeController: MenuBarDelegate {

    func didSelectItemAt(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)

        collectionView.scrollToItem(
            at: indexPath,
            at: [],
            animated: true
        )

        menuBar.selectItem(at: index)
    }

}
