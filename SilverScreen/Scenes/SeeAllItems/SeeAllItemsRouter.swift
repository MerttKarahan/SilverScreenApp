//
//  SeeAllItemsRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 9.11.2023.
//

import UIKit

typealias SeeAllItemsView = SeeAllItemsViewControllerProtocol & UIViewController

protocol SeeAllItemsRouterProtocol {
    func goBack()
    func pushDetailsViewController(id: String, itemType: ItemType)
}

final class SeeAllItemsRouter: SeeAllItemsRouterProtocol {

    var current: SeeAllItemsView?

    func goBack() {
        current?.navigationController?.popViewController(animated: true)
    }

    func pushDetailsViewController(id: String, itemType: ItemType) {
        let detailViewController = DetailsBuilder.build(id: id, itemType: itemType)
        current?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
