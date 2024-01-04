//
//  LoginBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 20.11.2023.
//

import UIKit

struct LoginBuilder {

    private init() { }

    static func build() -> UIViewController {
        let viewController = LoginViewController()
        let router = LoginRouter()
        let interactor = LoginInteractor(firebaseLoginHelper: FirebaseHelper())
        let presenter = LoginPresenter(viewController: viewController, router: router, interactor: interactor)

        viewController.presenter = presenter
        interactor.presenter = presenter
        router.current = viewController

        return viewController
    }
}
