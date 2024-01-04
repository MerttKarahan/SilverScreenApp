//
//  MockLoginPresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 10.12.2023.
//

@testable import SilverScreen
import XCTest

final class MockLoginPresenter: LoginPresenterProtocol {
    
    var invokedSignUpForUser: Bool = false
    var invokedSignUpForUserCount: Int = 0
    func signUpForUser(accountModel: SilverScreen.AccountModel) {
        self.invokedSignUpForUser = true
        self.invokedSignUpForUserCount += 1
    }
    
    var invokedSignInForUser: Bool = false
    var invokedSignInForUserCount: Int = 0
    func signInForUser(accountModel: SilverScreen.AccountModel) {
        self.invokedSignInForUser = true
        self.invokedSignInForUserCount += 1
    }
    
    
    var invokedDidFinishFirebaseLoginOperationsWithError: Bool = false
    var invokedDidFinishFirebaseLoginOperationsWithErrorCount: Int = 0
    func didFinishFirebaseLoginOperationsWithError(message: String?) {
        self.invokedDidFinishFirebaseLoginOperationsWithError = true
        self.invokedDidFinishFirebaseLoginOperationsWithErrorCount += 1
    }
    
    
    var invokedDidFinishFirebaseLoginOperationsSuccessfully: Bool = false
    var invokedDidFinishFirebaseLoginOperationsSuccessfullyCount: Int = 0
    func didFinishFirebaseLoginOperationsSuccessfully() {
        self.invokedDidFinishFirebaseLoginOperationsSuccessfully = true
        self.invokedDidFinishFirebaseLoginOperationsSuccessfullyCount += 1
    }
}
