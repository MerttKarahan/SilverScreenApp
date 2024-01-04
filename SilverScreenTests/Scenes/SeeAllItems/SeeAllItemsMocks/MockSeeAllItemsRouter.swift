//
//  MockSeeAllItemsRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen

final class MockSeeAllItemsRouter: SeeAllItemsRouterProtocol {
    
    var invokedGoBack: Bool = false
    var invokedGoBackCount: Int = 0
    func goBack() {
        self.invokedGoBack = true
        self.invokedGoBackCount += 1
    }
    
    var invokedPushDetailsViewController: Bool = false
    var invokedPushDetailsViewControllerCount: Int = 0
    func pushDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        self.invokedPushDetailsViewController = true
        self.invokedPushDetailsViewControllerCount += 1
    }
}
