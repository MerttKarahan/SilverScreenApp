//
//  MockLoginViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 9.12.2023.
//

@testable import SilverScreen

final class MockLoginViewController: LoginViewControllerProtocol {
    
    var invokedShowAlert: Bool = false
    var invokedShowAlertCount: Int = 0
    func showAlert(message: String?) {
        self.invokedShowAlert = true
        self.invokedShowAlertCount += 1
    }
    
    
    var invokedDidFetchAnError: Bool = false
    var invokedDidFetchAnErrorCount: Int = 0
    func didFetchAnError(errorMessage: String) {
        self.invokedDidFetchAnError = true
        self.invokedDidFetchAnErrorCount += 1
    }
}
