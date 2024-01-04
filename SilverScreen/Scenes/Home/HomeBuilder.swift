//
//  HomeBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 17.10.2023.
//

import UIKit

struct HomeBuilder {

    private init() { }

    static func build() -> UIViewController {
        let interactor = HomeInteractor(apiProtocol: MoviesTVShowsAPI())
        let viewController = HomeViewController()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router, view: viewController)

        interactor.presenter = presenter
        viewController.presenter = presenter
        router.current = viewController

        viewController.navigationItem.title = "Silver Screen"
        return UINavigationController(rootViewController: viewController)
    }
}
