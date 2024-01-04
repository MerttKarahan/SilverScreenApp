//
//  MockFirebaseProfileHelper.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 13.12.2023.
//

@testable import SilverScreen
import UIKit

final class MockFirebaseProfileHelper: FirebaseHelperProfileProtocol {
    var invokesSignOut: Bool = false
    var invokesSignOutCount: Int = 0
    func signOut(completionHandler: @escaping (String?) -> Void) {
        self.invokesSignOut = true
        self.invokesSignOutCount += 1
        completionHandler(nil)
    }
    
    var savedProfilePhotoShouldReturnError: Bool = false
    var invokesSavedProfilePhotoToFirestore: Bool = false
    var invokesSavedProfilePhotoToFirestoreCount: Int = 0
    var successfulSavedProfilePhotoToFirebase: Bool = false
    var successfulSavedProfilePhotoToFirebaseCount: Int = 0
    func savedProfilePhotoToFirestore(image: Data, completionHandler: @escaping (Result<String, Error>) -> Void) {
        self.invokesSavedProfilePhotoToFirestore = true
        self.invokesSavedProfilePhotoToFirestoreCount += 1
        
        if savedProfilePhotoShouldReturnError {
            self.successfulSavedProfilePhotoToFirebase = false
            completionHandler(.failure(NSError(domain: "", code: 1, userInfo: [:])))
        } else {
            self.successfulSavedProfilePhotoToFirebase = true
            self.successfulSavedProfilePhotoToFirebaseCount += 1
            completionHandler(.success("test successful"))
        }
    }
    
    var fetchProfilePhotoShouldReturnError: Bool = false
    var invokesFetchProfilePhoto: Bool = false
    var invokesFetchProfilePhotoCount: Int = 0
    var successfulFetchProfilePhoto: Bool = false
    var successfulFetchProfilePhotoCount: Int = 0
    func fetchProfilePhoto(completionHandler: @escaping (Result<UIImage?, Error>) -> Void) {
        self.invokesFetchProfilePhoto = true
        self.invokesFetchProfilePhotoCount += 1
        
        if fetchProfilePhotoShouldReturnError {
            self.successfulFetchProfilePhoto = false
            completionHandler(.failure(NSError(domain: "", code: 1, userInfo: [:])))
        } else {
            self.successfulFetchProfilePhoto = true
            self.successfulFetchProfilePhotoCount += 1
            completionHandler(.success(UIImage()))
        }
    }
    
    var fetchProfileDatasShouldReturnNil: Bool = false
    var invokesFetchProfileDatas: Bool = false
    var invokesFetchProfileDatasCount: Int = 0
    func fetchProfileDatas() -> SilverScreen.ProfileDatasModel? {
        self.invokesFetchProfileDatas = true
        self.invokesFetchProfileDatasCount += 1
        
        if fetchProfileDatasShouldReturnNil {
            return nil
        } else {
            return ProfileDatasModel(userId: "test", userMail: "test", accountCreatedDate: "test")
        }
    }
    
    
}
