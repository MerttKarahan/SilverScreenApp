//
//  LoginViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 17.10.2023.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject, AlertViewPresenter {
//    func didFetchAnError(errorMessage: String)
}

final class LoginViewController: UIViewController, LoginViewControllerProtocol {
    // All outlets should be private but I want to write Unit Test for this.
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitles()
    }

    // This method should be private but I want to write Unit Test for this.
    func setupTitles() {
        self.signInButton.setTitle("loginVC.signInButton.text".localized, for: .normal)
        self.signUpButton.setTitle("loginVC.signUpButton.text".localized, for: .normal)
        self.userEmailTextField.placeholder = "loginVC.emailTextfield.placeholder.text".localized
        self.userPasswordTextField.placeholder = "loginVC.password.placeholder.text".localized
    }

    // This method should be private but I want to write Unit Test for this.
    func createUserAccountModel(email: String?, password: String?) -> AccountModel? {
        if email != "" && password != "" {
            return AccountModel(mail: email, password: password)
        } else {
            self.showAlert(message: "alertVC.emptyMailorPassword.text".localized)
            return nil
        }
    }

    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let accountModel = self.createUserAccountModel(email: userEmailTextField.text, password: userPasswordTextField.text) else { return }
        self.presenter?.signInForUser(accountModel: accountModel)
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let accountModel = self.createUserAccountModel(email: userEmailTextField.text, password: userPasswordTextField.text) else { return }
        self.presenter?.signUpForUser(accountModel: accountModel)
    }
}
