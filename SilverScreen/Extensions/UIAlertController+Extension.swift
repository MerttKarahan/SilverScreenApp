//
//  UIAlertController+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 22.11.2023.
//

import UIKit

extension UIAlertController {

    // Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }

    // Set title font and title color
    func setTitle(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font: titleFont],
                                          range: NSMakeRange(0, title.utf8.count))
        }

        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: titleColor],
                                          range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")
    }

    // Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color ?? .white,
            .font: font ?? .systemFont(ofSize: 20)
        ]
        let attString = NSAttributedString(string: message, attributes: attributes)
        self.setValue(attString, forKey: "attributedMessage")
    }

    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}
