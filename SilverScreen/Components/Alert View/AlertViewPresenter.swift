//
//  AlertViewPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 2.01.2024.
//

import UIKit

protocol AlertViewPresenter {
    func showAlert(message: String?)
}

extension AlertViewPresenter where Self: UIViewController {

    func showAlert(message: String?) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "alertVC.infoErrorButtonTitle.text".localized, style: .default)
        // Change font and color of title
        alertView.setTitle(font: UIFont.boldSystemFont(ofSize: 24), color: UIColor.white)

        // Change font and color of message
        alertView.setMessage(font: nil, color: UIColor.white)

        // Change background color of UIAlertController
        alertView.setBackgroundColor(color: .black)

        alertAction.setValue(UIColor.orange, forKey: "titleTextColor")
        alertView.addAction(alertAction)
        self.present(alertView, animated: true)
    }
}
