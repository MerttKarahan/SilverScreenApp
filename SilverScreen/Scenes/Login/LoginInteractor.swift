//
//  LoginInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 8.12.2023.
//

import Foundation

protocol LoginInteractorProtocol {
    func signUpForUserFromFirebase(accountModel: AccountModel)
    func signInForUserFromFirebase(accountModel: AccountModel)
}

final class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol?
    private var firebaseLoginHelper: FirebaseHelperLoginProtocol?

    init(firebaseLoginHelper: FirebaseHelperLoginProtocol) {
        self.firebaseLoginHelper = firebaseLoginHelper
    }

    func signInForUserFromFirebase(accountModel: AccountModel) {
        firebaseLoginHelper?.signInForUser(accountModel: accountModel) { error in
            if let error = error {
                self.presenter?.didFinishFirebaseLoginOperationsWithError(message: error.localizedDescription)
            } else {
                self.presenter?.didFinishFirebaseLoginOperationsSuccessfully()
            }
        }
    }

    func signUpForUserFromFirebase(accountModel: AccountModel) {
        firebaseLoginHelper?.signUpForUser(accountModel: accountModel) { error in
            if let error = error {
                self.presenter?.didFinishFirebaseLoginOperationsWithError(message: error.localizedDescription)
            } else {
                self.presenter?.didFinishFirebaseLoginOperationsSuccessfully()
            }
        }
    }
}
