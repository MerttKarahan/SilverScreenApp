//
//  FavoritesBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 1.12.2023.
//

import UIKit

struct FavoritesBuilder {
    private init() { }

    static func build() -> UIViewController {
        let viewController = FavoritesViewController()
        let interactor = FavoritesInteractor(firebaseHelperReadingWritingProtocol: FirebaseHelper())
        let router = FavoritesRouter()
        let presenter = FavoritesPresenter(viewController: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter
        interactor.presenter = presenter
        router.current = viewController

        viewController.navigationItem.title = "Silver Screen"
        return UINavigationController(rootViewController: viewController)
    }
}
