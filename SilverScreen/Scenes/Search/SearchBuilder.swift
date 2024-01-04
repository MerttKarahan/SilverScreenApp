//
//  SearchBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

struct SearchBuilder {

    private init() { }

    static func build() -> UIViewController {
        let interactor = SearchInteractor(apiProtocol: MoviesTVShowsAPI())
        let router = SearchRouter()
        let viewController = SearchViewController()
        let presenter = SearchPresenter(viewController: viewController, interactor: interactor, router: router)

        interactor.presenter = presenter
        viewController.presenter = presenter
        router.current = viewController

        viewController.navigationItem.title = "Silver Screen"
        return UINavigationController(rootViewController: viewController)
    }
}
