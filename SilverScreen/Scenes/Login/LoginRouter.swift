//
//  LoginRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 17.10.2023.
//

import UIKit

typealias LoginView = LoginViewControllerProtocol & UIViewController

protocol LoginRouterProtocol {
    func pushToHomeViewController()
}

final class LoginRouter: LoginRouterProtocol {

    var current: LoginView?

    func pushToHomeViewController() {
        let homeViewController = TabBarViewController()
        current?.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
