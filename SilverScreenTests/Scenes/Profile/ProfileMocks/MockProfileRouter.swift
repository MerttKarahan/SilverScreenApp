//
//  MockProfileRouter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

@testable import SilverScreen

final class MockProfileRouter: ProfileRouterProtocol {
    var invokeGoBackLoginViewController: Bool = false
    var invokeGoBackLoginViewControllerCount: Int = 0
    func goBackLoginViewController() {
        self.invokeGoBackLoginViewController = true
        self.invokeGoBackLoginViewControllerCount += 1
    }
}
