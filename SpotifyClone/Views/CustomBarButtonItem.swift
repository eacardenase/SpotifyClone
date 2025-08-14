//
//  CustomBarButtonItem.swift
//  SpotifyClone
//
//  Created by Edwin Cardenas on 8/13/25.
//

import UIKit

class CustomBarButtonItem: UIBarButtonItem {

    // MARK: - View Lifecycle

    init(title: String, target: UIViewController, action: Selector) {
        let button = UIButton(type: .custom)

        button.addTarget(target, action: action, for: .touchUpInside)

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .largeTitle
            ).withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold)
        else {
            fatalError("Could not create font.")
        }

        let attributedTitle = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont(descriptor: fontDescriptor, size: 0),
                .foregroundColor: UIColor.white,
            ]
        )

        button.setAttributedTitle(attributedTitle, for: .normal)

        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 16
        )

        button.configuration = config

        super.init()
        self.customView = button
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
