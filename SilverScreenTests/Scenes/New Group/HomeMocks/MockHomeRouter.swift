//
//  MockHomeRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 27.12.2023.
//

@testable import SilverScreen

final class MockHomeRouter: HomeRouterProtocol {
    
    var invokedpushToSeeAllItemsViewController: Bool = false
    var invokedpushToSeeAllItemsViewControllerCount: Int = 0
    func pushToSeeAllItemsViewController(existItems: [Decodable], page: Int, itemType: SilverScreen.ItemType, collectionView: SilverScreen.HomeViewCollectionViews) {
        self.invokedpushToSeeAllItemsViewController = true
        self.invokedpushToSeeAllItemsViewControllerCount += 1
    }
    
    var invokedPushToDetailsViewController: Bool = false
    var invokedPushToDetailsViewControllerCount: Int = 0
    func pushToDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        self.invokedPushToDetailsViewController = true
        self.invokedPushToDetailsViewControllerCount += 1
    }
}
