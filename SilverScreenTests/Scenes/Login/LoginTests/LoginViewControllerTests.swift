//
//  LoginViewControllerTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 10.12.2023.
//

import XCTest
@testable import SilverScreen

final class LoginViewControllerTests: XCTestCase {
    
    private var sutViewController: LoginViewController!
    private var presenter: MockLoginPresenter!

    override func setUp() {
        super.setUp()
        sutViewController = LoginViewController()
        presenter = .init()
        sutViewController.presenter = presenter
        sutViewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        sutViewController = nil
        presenter = nil
    }
    
    func test_signInButton_signUpButton_WhenCreated_HasButtonAndAction() throws {
        // Given
        let signInButton = try XCTUnwrap(sutViewController.signInButton, "SignIn button does not have refencing outlet")
        let signUpButton = try XCTUnwrap(sutViewController.signUpButton, "SignUp button does not have refencing outlet")

        // When
        let signInButtonAction = try XCTUnwrap(signInButton.actions(forTarget: sutViewController, forControlEvent: .touchUpInside), "SignIn button does not have any actions assigned to it")
        let signUpButtonAction = try XCTUnwrap(signUpButton.actions(forTarget: sutViewController, forControlEvent: .touchUpInside), "SignUp button does not have any actions assigned to it")

        // Then
        XCTAssertEqual(signInButtonAction.count, 1)
        XCTAssertEqual(signInButtonAction.first, "signInButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
        XCTAssertEqual(signUpButtonAction.count, 1)
        XCTAssertEqual(signUpButtonAction.first, "signUpButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    
    func test_userEmailTextFiled_userPasswordTextField_WhenCreated_HasRequiredTextFieldEmpty() throws {
        // Then
        let userEmailTextField = try XCTUnwrap(sutViewController.userEmailTextField, "The userEmailTextField is not connected to an IBOutlet")
        let userPasswordTextField = try XCTUnwrap(sutViewController.userPasswordTextField, "The userPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(userEmailTextField.text, "", "userEmailTextField was not empty when the view controller initially loaded")
        XCTAssertEqual(userPasswordTextField.text, "", "userPasswordTextField was not empty when the view controller initially loaded")
    }
    
    func test_signInButtonTapped_signUpButtonTapped_InvokesRequiredMethod() {
        // Given
        XCTAssertEqual(presenter.invokedSignInForUserCount, 0)
        XCTAssertEqual(presenter.invokedSignUpForUserCount, 0)
        sutViewController.userEmailTextField.text = "test@test.com"
        sutViewController.userPasswordTextField.text = "test"

        // When
        sutViewController.signInButton.sendActions(for: .touchUpInside)
        sutViewController.signUpButton.sendActions(for: .touchUpInside)
        
        // Then
        XCTAssertEqual(presenter.invokedSignInForUser, true)
        XCTAssertEqual(presenter.invokedSignInForUserCount, 1)
        XCTAssertEqual(presenter.invokedSignUpForUser, true)
        XCTAssertEqual(presenter.invokedSignUpForUserCount, 1)
    }
    
    func test_signInButtonTapped_signUpButtonTapped_NotInvokesRequiredMethod() {
        // Given
        XCTAssertEqual(presenter.invokedSignInForUserCount, 0)
        XCTAssertEqual(presenter.invokedSignUpForUserCount, 0)
        sutViewController.userEmailTextField.text = ""
        sutViewController.userPasswordTextField.text = ""

        // When
        sutViewController.signInButton.sendActions(for: .touchUpInside)
        sutViewController.signUpButton.sendActions(for: .touchUpInside)
        
        // Then
        XCTAssertEqual(presenter.invokedSignInForUser, false)
        XCTAssertEqual(presenter.invokedSignInForUserCount, 0)
        XCTAssertEqual(presenter.invokedSignUpForUser, false)
        XCTAssertEqual(presenter.invokedSignUpForUserCount, 0)
    }
    
    func test_createUserAccountModel_WhenGivenValidEmailAndPassword_ShouldReturnNotNil() {
        // Given
        let email = "test@test.com"
        let password = "test"

        // Then
        XCTAssertNotNil(sutViewController.createUserAccountModel(email: email, password: password))
    }

    func test_createUserAccountModel_WhenGivenInvalidEmailAndPassword_ShouldReturnNil() {
        // Given
        let email = ""
        let password = ""

        // Then
        XCTAssertNil(sutViewController.createUserAccountModel(email: email, password: password))
    }
}
