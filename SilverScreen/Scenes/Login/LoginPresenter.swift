//
//  LoginPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 17.10.2023.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func signUpForUser(accountModel: AccountModel)
    func signInForUser(accountModel: AccountModel)
    func didFinishFirebaseLoginOperationsWithError(message: String?)
    func didFinishFirebaseLoginOperationsSuccessfully()
}

final class LoginPresenter: LoginPresenterProtocol {

    weak var viewController: LoginViewControllerProtocol?
    private var router: LoginRouterProtocol?
    private var interactor: LoginInteractorProtocol?

    init(viewController: LoginViewControllerProtocol, router: LoginRouterProtocol, interactor: LoginInteractorProtocol) {
        self.viewController = viewController
        self.router = router
        self.interactor = interactor
    }

    func signInForUser(accountModel: AccountModel) {
        self.interactor?.signInForUserFromFirebase(accountModel: accountModel)
    }

    func signUpForUser(accountModel: AccountModel) {
        self.interactor?.signUpForUserFromFirebase(accountModel: accountModel)
    }

    func didFinishFirebaseLoginOperationsWithError(message: String?) {
        guard let message = message else { return }
        self.viewController?.showAlert(message: message)
    }

    func didFinishFirebaseLoginOperationsSuccessfully() {
        self.router?.pushToHomeViewController()
    }
}
