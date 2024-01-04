//
//  MockDetailsRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen

final class MockDetailsRouter: DetailsRouterProtocol {
    var invokedGoBack: Bool = false
    var invokedGoBackCount: Int = 0
    func goBack() {
        self.invokedGoBack = true
        self.invokedGoBackCount += 1
    }
    
    var invokedPushOtherDetailsViewController: Bool = false
    var invokedPushOtherDetailsViewControllerCount: Int = 0
    func pushOtherDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        self.invokedPushOtherDetailsViewController = true
        self.invokedPushOtherDetailsViewControllerCount += 1
    }
}
