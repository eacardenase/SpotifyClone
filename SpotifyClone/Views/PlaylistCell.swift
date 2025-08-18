//
//  PlaylistCell.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

class PlaylistCell: UICollectionViewCell {

    // MARK: Properties

    var tracks: [Track]?

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical

        let _collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        _collectionView.translatesAutoresizingMaskIntoConstraints = false
        _collectionView.register(
            TrackCell.self,
            forCellWithReuseIdentifier: NSStringFromClass(TrackCell.self)
        )
        _collectionView.backgroundColor = .spotifyBlack
        _collectionView.dataSource = self
        _collectionView.delegate = self

        return _collectionView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension PlaylistCell {

    private func setupViews() {
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}

// MARK: - UICollectionViewDelegate

extension PlaylistCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource

extension PlaylistCell: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return tracks?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NSStringFromClass(TrackCell.self),
                for: indexPath
            ) as? TrackCell
        else {
            fatalError("Could not cast collection view cell to TrackCell")
        }

        cell.track = tracks?[indexPath.item]

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlaylistCell: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: frame.width, height: 72)
    }

}
