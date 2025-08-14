//
//  ContainerViewController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/13/25.
//

import UIKit

class ContainerViewController: UIViewController {

    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )

        return pageVC
    }()
    var pages: [UIViewController]

    // MARK: - Initializes

    init(withPages pages: [UIViewController]) {
        self.pages = pages

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

// MARK: - Helpers

extension ContainerViewController {

    private func setupViews() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)

        pageViewController.view.bounds = view.bounds
        pageViewController.didMove(toParent: self)
        pageViewController.setViewControllers(
            [pages.first!],
            direction: .forward,
            animated: true
        )
    }

}
