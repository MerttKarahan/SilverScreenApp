//
//  MockLoginRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 9.12.2023.
//

@testable import SilverScreen

final class MockLoginRouter: LoginRouterProtocol {

    var invokedPushToHomeViewController: Bool = false
    var invokedPushToHomeViewControllerCount: Int = 0
    func pushToHomeViewController() {
        self.invokedPushToHomeViewController = true
        self.invokedPushToHomeViewControllerCount += 1
    }
}
