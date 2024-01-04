//
//  MockLoginInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 9.12.2023.
//

@testable import SilverScreen

final class MockLoginInteractor: LoginInteractorProtocol {

    var invokedSignUpForUserFromFirebase: Bool = false
    var invokedSignUpForUserFromFirebaseCount: Int = 0
    func signUpForUserFromFirebase(accountModel: SilverScreen.AccountModel) {
        self.invokedSignUpForUserFromFirebase = true
        self.invokedSignUpForUserFromFirebaseCount += 1
    }

    var invokedSignInForUserFromFirebase: Bool = false
    var invokedSignInForUserFromFirebaseCount: Int = 0
    func signInForUserFromFirebase(accountModel: SilverScreen.AccountModel) {
        self.invokedSignInForUserFromFirebase = true
        self.invokedSignInForUserFromFirebaseCount += 1
    }
}
