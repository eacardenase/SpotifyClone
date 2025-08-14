//
//  ContainerViewController.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/13/25.
//

import UIKit

protocol ContainerViewControllerDelegate: AnyObject {

    func willTransition(to pendingViewControllers: [UIViewController])

}

class ContainerViewController: UIViewController {

    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )

        return pageVC
    }()
    var pages: [UIViewController]
    var currentViewController: UIViewController

    weak var delegate: ContainerViewControllerDelegate?

    // MARK: - Initializes

    init(withPages pages: [UIViewController]) {
        self.pages = pages
        self.currentViewController = pages.first!

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

        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.view.bounds = view.bounds
        pageViewController.didMove(toParent: self)
        pageViewController.setViewControllers(
            [pages.first!],
            direction: .forward,
            animated: true
        )

        currentViewController = pages.first!
    }

}

// MARK: - UIPageViewControllerDataSource

extension ContainerViewController: UIPageViewControllerDataSource {

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

extension ContainerViewController: UIPageViewControllerDelegate {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        delegate?.willTransition(to: pendingViewControllers)
    }

}
