//
//  LoginPresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 9.12.2023.
//

import XCTest
@testable import SilverScreen

final class LoginPresenterTests: XCTestCase {
    
    private var sutPresenter: LoginPresenter!
    private var viewController: MockLoginViewController!
    private var interactor: MockLoginInteractor!
    private var router: MockLoginRouter!
    
    override func setUp() {
        super.setUp()
        viewController = .init()
        interactor = .init()
        router = .init()
        sutPresenter = .init(viewController: viewController, router: router, interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
        interactor = nil
        router = nil
        sutPresenter = nil
    }
    
    func test_signInForUser_InvokesRequiredMethod() {
        // Given
        XCTAssertEqual(interactor.invokedSignInForUserFromFirebaseCount, 0)
        let accountModel = AccountModel(mail: "test", password: "test")

        // When
        sutPresenter.signInForUser(accountModel: accountModel)
        
        // Then
        XCTAssertEqual(interactor.invokedSignInForUserFromFirebase, true)
        XCTAssertEqual(interactor.invokedSignInForUserFromFirebaseCount, 1)
    }
    
    func test_signUpForUser_InvokesRequiredMethod() {
        // Given
        XCTAssertEqual(interactor.invokedSignUpForUserFromFirebaseCount, 0)
        let accountModel = AccountModel(mail: "test", password: "test")

        // When
        sutPresenter.signUpForUser(accountModel: accountModel)

        // Then
        XCTAssertEqual(interactor.invokedSignUpForUserFromFirebase, true)
        XCTAssertEqual(interactor.invokedSignUpForUserFromFirebaseCount, 1)
    }
    
    func test_didFinishFirebaseLoginOperationsWithError_InvokesRequiredMethod() {
        // Given
        XCTAssertEqual(viewController.invokedShowAlertCount, 0)
        let message: String = "test"
        
        // When
        sutPresenter.didFinishFirebaseLoginOperationsWithError(message: message)
        
        // Then
        XCTAssertEqual(viewController.invokedShowAlert, true)
        XCTAssertEqual(viewController.invokedShowAlertCount, 1)
    }
    
    func test_didFinishFirebaseLoginOperationsWithError_WhenGivenNilAsParameters_InvokedRequiredMethodReturnFalse() {
        // Given
        XCTAssertEqual(viewController.invokedShowAlertCount, 0)
        let message: String? = nil

        // When
        sutPresenter.didFinishFirebaseLoginOperationsWithError(message: message)

        // Then
        XCTAssertEqual(viewController.invokedShowAlert, false)
        XCTAssertEqual(viewController.invokedShowAlertCount, 0)
    }
    
    func test_didfinishFirebaseLoginOperationsSuccessfully_InvokeRequiredMethod() {
        // Given
        XCTAssertEqual(router.invokedPushToHomeViewControllerCount, 0)
        
        // When
        sutPresenter.didFinishFirebaseLoginOperationsSuccessfully()
        
        // Then
        XCTAssertEqual(router.invokedPushToHomeViewController, true)
        XCTAssertEqual(router.invokedPushToHomeViewControllerCount, 1)
    }
}
