//
//  MockSearchRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen

final class MockSearchRouter: SearchRouterProtocol {
    
    var invokedPushToDetailsViewController: Bool = false
    var invokedPushToDetailsViewControllerCount: Int = 0
    func pushToDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        self.invokedPushToDetailsViewController = true
        self.invokedPushToDetailsViewControllerCount += 1
    }
}
