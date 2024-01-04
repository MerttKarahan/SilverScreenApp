//
//  MockFavoriteRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

@testable import SilverScreen

final class MockFavoriteRouter: FavoritesRouterProtocol {
    var invokedPushToDetailViewController: Bool = false
    var invokedPushToDetailViewControllerCount: Int = 0
    func pushToDetailViewController(id: String, itemType: SilverScreen.ItemType) {
        self.invokedPushToDetailViewController = true
        self.invokedPushToDetailViewControllerCount += 1
    }
}
