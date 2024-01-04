//
//  DetailsRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 12.11.2023.
//

import UIKit

typealias DetailsView = DetailsViewControllerProtocol & UIViewController

protocol DetailsRouterProtocol {
    func goBack()
    func pushOtherDetailsViewController(id: String, itemType: ItemType)
}

final class DetailsRouter: DetailsRouterProtocol {

    var current: DetailsView?

    func goBack() {
        current?.navigationController?.popViewController(animated: true)
    }

    func pushOtherDetailsViewController(id: String, itemType: ItemType) {
        let detailsViewController = DetailsBuilder.build(id: id, itemType: itemType)
//        self.goBack()
        current?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
