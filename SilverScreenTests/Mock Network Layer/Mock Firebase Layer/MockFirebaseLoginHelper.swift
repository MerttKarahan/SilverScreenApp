//
//  MockFirebaseLoginHelper.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

@testable import SilverScreen
import Foundation

final class MockFirebaseLoginHelper: FirebaseHelperLoginProtocol {
    
    var shouldReturnError: Bool = false

    var invokeSignInForUser: Bool = false
    var invokeSignInForUserCount: Int = 0
    var successfulSignInOperation: Bool = false
    var successfulSignInOperationCount: Int = 0
    var failureSignInOperationCount: Int = 0
    func signInForUser(accountModel: SilverScreen.AccountModel, completionHandler: @escaping (Error?) -> Void) {
        self.invokeSignInForUser = true
        self.invokeSignInForUserCount += 1
        
        if shouldReturnError {
            self.successfulSignInOperation = false
            self.failureSignInOperationCount += 1
            completionHandler(NSError(domain: "", code: 1, userInfo: [:]))
        } else {
            self.successfulSignInOperation = true
            self.successfulSignInOperationCount += 1
            completionHandler(nil)
        }
    }
    
    var invokeSignUpForUser: Bool = false
    var invokeSignUpForUserCount: Int = 0
    var successfulSignUpOperation: Bool = false
    var successfulSignUpOperationCount: Int = 0
    var failureSignUpOperationCount: Int = 0
    func signUpForUser(accountModel: SilverScreen.AccountModel, completionHandler: @escaping (Error?) -> Void) {
        self.invokeSignUpForUser = true
        self.invokeSignUpForUserCount += 1
        
        if shouldReturnError {
            self.successfulSignUpOperation = false
            self.failureSignUpOperationCount += 1
            completionHandler(NSError(domain: "", code: 1, userInfo: [:]))
        } else {
            self.successfulSignUpOperation = true
            self.successfulSignUpOperationCount += 1
            completionHandler(nil)
        }
    }
}

