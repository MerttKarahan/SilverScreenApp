//
//  DetailsBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 12.11.2023.
//

import UIKit

struct DetailsBuilder {

    private init() { }

    static func build(id: String, itemType: ItemType) -> UIViewController {
        let viewController = DetailsViewController()
        let interactor = DetailsInteractor(apiProtocol: MoviesTVShowsAPI(), firebaseProtocol: FirebaseHelper())
        let router = DetailsRouter()
        let presenter = DetailsPresenter(viewController: viewController, interactor: interactor, router: router, id: id, itemType: itemType)

        viewController.presenter = presenter
        interactor.presenter = presenter
        router.current = viewController

        return viewController
    }
}
