//
//  LoginInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 10.12.2023.
//

import XCTest
@testable import SilverScreen

final class LoginInteractorTests: XCTestCase {
    
    private var sutInteractor: LoginInteractor!
    private var presenter: MockLoginPresenter!
    private var firebaseHelper: MockFirebaseLoginHelper!
    
    override func setUp() {
        super.setUp()
        presenter = .init()
        firebaseHelper = .init()
        sutInteractor = LoginInteractor(firebaseLoginHelper: firebaseHelper)
        sutInteractor.presenter = presenter
    }

    override func tearDown() {
        super.tearDown()
        self.sutInteractor = nil
        self.presenter = nil
        self.firebaseHelper = nil
    }
    
    func test_signInUserFromFirebase_WhenSignInSuccessfully_ShouldInvokeDidFinishFirebaseLoginOperationsSuccessfully() {
        // Given
        XCTAssertEqual(firebaseHelper.invokeSignInForUserCount, 0)
        XCTAssertEqual(firebaseHelper.successfulSignInOperation, false)
        XCTAssertEqual(firebaseHelper.successfulSignInOperationCount, 0)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfully, false)
        firebaseHelper.shouldReturnError = false
        let accountModel = AccountModel(mail: "test@test.com", password: "test")

        // When
        sutInteractor.signInForUserFromFirebase(accountModel: accountModel)

        // Then
        XCTAssertEqual(firebaseHelper.invokeSignInForUser, true)
        XCTAssertEqual(firebaseHelper.invokeSignInForUserCount, 1)
        XCTAssertEqual(firebaseHelper.successfulSignInOperation, true)
        XCTAssertEqual(firebaseHelper.successfulSignInOperationCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfully, true)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfullyCount, 1)
    }
    
    func test_signInUserFromFirebase_WhenNotSignIn_ShouldInvokeDidFinishFirebaseLoginOperationsWithError() {
        // Given
        XCTAssertEqual(firebaseHelper.invokeSignInForUserCount, 0)
        XCTAssertEqual(firebaseHelper.successfulSignInOperation, false)
        XCTAssertEqual(firebaseHelper.failureSignInOperationCount, 0)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithError, false)
        firebaseHelper.shouldReturnError = true
        let accountModel = AccountModel(mail: "test@test.com", password: "test")

        // When
        sutInteractor.signInForUserFromFirebase(accountModel: accountModel)

        // Then
        XCTAssertEqual(firebaseHelper.invokeSignInForUser, true)
        XCTAssertEqual(firebaseHelper.invokeSignInForUserCount, 1)
        XCTAssertEqual(firebaseHelper.successfulSignInOperation, false)
        XCTAssertEqual(firebaseHelper.failureSignInOperationCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithError, true)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithErrorCount, 1)
    }
    
    func test_signUpForUserFromFirebase_WhenSignInSuccessfully_ShouldInvokeDidFinishFirebaseLoginOperationsSuccessfully() {
        // Given
        XCTAssertEqual(firebaseHelper.invokeSignUpForUserCount, 0)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperation, false)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperationCount, 0)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfully, false)
        firebaseHelper.shouldReturnError = false
        let accountModel = AccountModel(mail: "test@test.com", password: "test")

        // When
        sutInteractor.signUpForUserFromFirebase(accountModel: accountModel)

        // Then
        XCTAssertEqual(firebaseHelper.invokeSignUpForUser, true)
        XCTAssertEqual(firebaseHelper.invokeSignUpForUserCount, 1)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperation, true)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperationCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfully, true)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsSuccessfullyCount, 1)
    }
    
    func test_signUpForUserFromFirebase_WhenNotSignIn_ShouldInvokeDidFinishFirebaseLoginOperationsWithError() {
        // Given
        XCTAssertEqual(firebaseHelper.invokeSignUpForUserCount, 0)
        XCTAssertEqual(firebaseHelper.failureSignUpOperationCount, 0)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperation, false)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithError, false)
        let accountModel = AccountModel(mail: "test@test.com", password: "test")
        firebaseHelper.shouldReturnError = true

        // When
        sutInteractor.signUpForUserFromFirebase(accountModel: accountModel)

        // Then
        XCTAssertEqual(firebaseHelper.invokeSignUpForUser, true)
        XCTAssertEqual(firebaseHelper.invokeSignUpForUserCount, 1)
        XCTAssertEqual(firebaseHelper.failureSignUpOperationCount, 1)
        XCTAssertEqual(firebaseHelper.successfulSignUpOperation, false)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithError, true)
        XCTAssertEqual(presenter.invokedDidFinishFirebaseLoginOperationsWithErrorCount, 1)
    }
}
