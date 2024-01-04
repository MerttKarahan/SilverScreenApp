//
//  ProfileBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

struct ProfileBuilder {

    private init() { }

    static func build() -> UIViewController {
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor(firebaseProfileHelper: FirebaseHelper())
        let router = ProfileRouter()
        let presenter = ProfilePresenter(viewController: viewController, interactor: interactor, router: router)

        interactor.presenter = presenter
        viewController.presenter = presenter
        router.current = viewController

        return viewController
    }
}
