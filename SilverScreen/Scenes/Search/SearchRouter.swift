//
//  SearchRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

typealias SearchView = SearchViewControllerProtocol & UIViewController

protocol SearchRouterProtocol {
    func pushToDetailsViewController(id: String, itemType: ItemType)
}

final class SearchRouter: SearchRouterProtocol {

    var current: SearchView?

    func pushToDetailsViewController(id: String, itemType: ItemType) {
        let detailsViewController = DetailsBuilder.build(id: id, itemType: itemType)
        current?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
