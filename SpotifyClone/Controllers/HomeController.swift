//
//  HomeController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/14/25.
//

import UIKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class HomeController: UIViewController {

    // MARK: - Properties

    lazy var menuBar = {
        let _menuBar = MenuBar()

        _menuBar.delegate = self

        return _menuBar
    }()

    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )

        pageVC.dataSource = self
        pageVC.delegate = self

        return pageVC
    }()

    var pages: [UIViewController] = [
        ViewController1(),
        ViewController2(),
        ViewController3(),
    ]

    lazy var currentViewController: UIViewController = {
        return pages.first!
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

        pageViewController.view.translatesAutoresizingMaskIntoConstraints =
            false

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

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

        // pageViewController.view
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(
                equalTo: menuBar.bottomAnchor,
                constant: 2
            ),
            pageViewController.view.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            pageViewController.view.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            pageViewController.view.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])

        pageViewController.setViewControllers(
            [
                pages.first!
            ],
            direction: .forward,
            animated: true
        )

        currentViewController = pages.first!
        menuBar.selectItem(at: 0)
    }

}

// MARK: - UIPageViewControllerDataSource

extension HomeController: UIPageViewControllerDataSource {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = pages.firstIndex(of: viewController),
            index - 1 >= 0
        else {
            return nil
        }

        currentViewController = pages[index - 1]

        return currentViewController
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = pages.firstIndex(of: viewController),
            index + 1 < pages.count
        else {
            return nil
        }

        currentViewController = pages[index + 1]

        return currentViewController
    }

}

// MARK: - UIPageViewControllerDelegate

extension HomeController: UIPageViewControllerDelegate {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        if let pendingVC = pendingViewControllers.first,
            let index = pages.firstIndex(of: pendingVC)
        {
            menuBar.selectItem(at: index)
        }
    }

}

// MARK: - MenuBarDelegate

extension HomeController: MenuBarDelegate {

    func buttonTapped(_ sender: UIButton) {
        guard
            let index = pages.firstIndex(
                of: currentViewController
            ), index != sender.tag
        else {
            return
        }

        currentViewController = pages[sender.tag]

        let scrollDirection: UIPageViewController.NavigationDirection =
            index > sender.tag ? .reverse : .forward

        pageViewController.setViewControllers(
            [currentViewController],
            direction: scrollDirection,
            animated: true
        )

        menuBar.selectItem(at: sender.tag)
    }

}
