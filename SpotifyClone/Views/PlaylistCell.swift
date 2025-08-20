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

    lazy var tableView: UITableView = {
        let _tableView = UITableView()

        _tableView.translatesAutoresizingMaskIntoConstraints = false
        _tableView.register(
            TrackCell.self,
            forCellReuseIdentifier: NSStringFromClass(TrackCell.self)
        )
        _tableView.backgroundColor = .spotifyBlack
        _tableView.dataSource = self
        _tableView.delegate = self

        return _tableView
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
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}

// MARK: - UITableViewDelegate

extension PlaylistCell: UITableViewDelegate {

}

// MARK: - UITableViewDataSource

extension PlaylistCell: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return tracks?.count ?? 0
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NSStringFromClass(TrackCell.self),
                for: indexPath
            ) as? TrackCell
        else {
            fatalError("Could not cast table view cell to TrackCell")
        }

        cell.track = tracks?[indexPath.item]
        cell.selectionStyle = .none

        return cell
    }

}
