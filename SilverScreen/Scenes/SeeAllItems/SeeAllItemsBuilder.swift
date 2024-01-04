//
//  SeeAllItemsBuilder.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 9.11.2023.
//

import UIKit

struct SeeAllItemsBuilder {

    private init() { }

    static func build(existItems: [Decodable], page: Int, itemType: ItemType, collectionView: HomeViewCollectionViews) -> UIViewController {
        let interactor = SeeAllItemsInteractor(apiProtocol: MoviesTVShowsAPI())
        let viewController = SeeAllItemsViewController()
        let router = SeeAllItemsRouter()
        let presenter = SeeAllItemsPresenter(viewController: viewController, interactor: interactor, router: router, existItems: existItems, page: page, itemType: itemType, collectionView: collectionView)

        interactor.presenter = presenter
        viewController.presenter = presenter
        router.current = viewController

        return viewController
    }
}
