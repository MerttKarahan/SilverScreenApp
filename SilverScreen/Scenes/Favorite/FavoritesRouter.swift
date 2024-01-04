//
//  FavoritesRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 1.12.2023.
//

import UIKit

typealias FavoritesView = FavoritesViewControllerProtocol & UIViewController

protocol FavoritesRouterProtocol {
    func pushToDetailViewController(id: String, itemType: ItemType)
}

final class FavoritesRouter: FavoritesRouterProtocol {

    var current: FavoritesView?

    func pushToDetailViewController(id: String, itemType: ItemType) {
        let detailViewController = DetailsBuilder.build(id: id, itemType: itemType)
        current?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
