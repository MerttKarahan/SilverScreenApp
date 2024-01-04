//
//  HomeRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 6.10.2023.
//

import UIKit

typealias HomeView = HomeViewControllerProtocol & UIViewController

protocol HomeRouterProtocol {
    func pushToSeeAllItemsViewController(existItems: [Decodable], page: Int, itemType: ItemType, collectionView: HomeViewCollectionViews)
    func pushToDetailsViewController(id: String, itemType: ItemType)
}

final class HomeRouter: HomeRouterProtocol {

    var current: HomeView?

    func pushToSeeAllItemsViewController(existItems: [Decodable], page: Int, itemType: ItemType, collectionView: HomeViewCollectionViews) {
        let seeAllViewController = SeeAllItemsBuilder.build(existItems: existItems, page: page, itemType: itemType, collectionView: collectionView)
        current?.navigationController?.pushViewController(seeAllViewController, animated: true)
    }

    func pushToDetailsViewController(id: String, itemType: ItemType) {
        let detailViewController = DetailsBuilder.build(id: id, itemType: itemType)
        current?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
