//
//  ProfileInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

import XCTest
@testable import SilverScreen

final class ProfileInteractorTests: XCTestCase {
    private var sutInteractor: ProfileInteractor!
    private var presenter: MockProfilePresenter!
    private var firebaseProfileHelper: MockFirebaseProfileHelper!
    override func setUp() {
        super.setUp()
        self.presenter = .init()
        self.firebaseProfileHelper = .init()
        self.sutInteractor = .init(firebaseProfileHelper: firebaseProfileHelper)
        sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.sutInteractor = nil
        self.presenter = nil
        self.firebaseProfileHelper = nil
    }
    
    func test_savePhotoToFirebase_WhenSavedSuccessful_ShouldInvokesDidSavedPhotoToFirebase() {
        // Given
        XCTAssertFalse(presenter.invokesDidSavedPhotoToFirebase)
        XCTAssertFalse(firebaseProfileHelper.invokesSavedProfilePhotoToFirestore)
        XCTAssertFalse(firebaseProfileHelper.successfulSavedProfilePhotoToFirebase)
        let imageData = Data()
        firebaseProfileHelper.savedProfilePhotoShouldReturnError = false
        
        // When
        sutInteractor.savePhotoToFirebase(image: imageData)
        
        // Then
        XCTAssertTrue(presenter.invokesDidSavedPhotoToFirebase)
        XCTAssertEqual(presenter.invokesDidSavedPhotoToFirebaseCount, 1)
        XCTAssertTrue(firebaseProfileHelper.invokesSavedProfilePhotoToFirestore)
        XCTAssertTrue(firebaseProfileHelper.successfulSavedProfilePhotoToFirebase)
        XCTAssertEqual(firebaseProfileHelper.invokesSavedProfilePhotoToFirestoreCount, 1)
        XCTAssertEqual(firebaseProfileHelper.successfulSavedProfilePhotoToFirebaseCount, 1)
    }
    
    func test_savePhotoToFirebase_WhenFailureSaving_ShouldInvokesDidSavedPhotoToFirebase() {
        XCTAssertFalse(presenter.invokesDidSavedPhotoToFirebase)
        XCTAssertFalse(firebaseProfileHelper.invokesSavedProfilePhotoToFirestore)
        XCTAssertFalse(firebaseProfileHelper.successfulSavedProfilePhotoToFirebase)
        let imageData = Data()
        firebaseProfileHelper.savedProfilePhotoShouldReturnError = true
        
        // When
        sutInteractor.savePhotoToFirebase(image: imageData)
        
        // Then
        XCTAssertTrue(presenter.invokesDidSavedPhotoToFirebase)
        XCTAssertEqual(presenter.invokesDidSavedPhotoToFirebaseCount, 1)
        XCTAssertTrue(firebaseProfileHelper.invokesSavedProfilePhotoToFirestore)
        XCTAssertFalse(firebaseProfileHelper.successfulSavedProfilePhotoToFirebase)
        XCTAssertEqual(firebaseProfileHelper.invokesSavedProfilePhotoToFirestoreCount, 1)
        XCTAssertEqual(firebaseProfileHelper.successfulSavedProfilePhotoToFirebaseCount, 0)
    }
    
    func test_fetchPhotoFromFirebase_WhenFetchSuccessful_ShouldInvokesDidFetchProfilePhotoFromInteractor() {
        // Given
        XCTAssertFalse(presenter.invokesDidFetchProfilePhotoFromInteractor)
        XCTAssertFalse(firebaseProfileHelper.invokesFetchProfilePhoto)
        XCTAssertFalse(firebaseProfileHelper.successfulFetchProfilePhoto)
        firebaseProfileHelper.fetchProfilePhotoShouldReturnError = false
        
        // When
        sutInteractor.fetchPhotoFromFirebase()
        
        // Then
        XCTAssertTrue(firebaseProfileHelper.invokesFetchProfilePhoto)
        XCTAssertTrue(firebaseProfileHelper.successfulFetchProfilePhoto)
        XCTAssertEqual(firebaseProfileHelper.invokesFetchProfilePhotoCount, 1)
        XCTAssertEqual(firebaseProfileHelper.successfulFetchProfilePhotoCount, 1)
        XCTAssertTrue(presenter.invokesDidFetchProfilePhotoFromInteractor)
        XCTAssertEqual(presenter.invokesDidFetchProfilePhotoFromInteractorCount, 1)
    }
    
    func test_fetchPhotoFromFirebase_WhenFailureFetching_ShouldInvokesDidFetchProfilePhotoFromInteractor() {
        // Given
        XCTAssertFalse(presenter.invokesDidFetchProfilePhotoFromInteractor)
        XCTAssertFalse(firebaseProfileHelper.invokesFetchProfilePhoto)
        XCTAssertFalse(firebaseProfileHelper.successfulFetchProfilePhoto)
        firebaseProfileHelper.fetchProfilePhotoShouldReturnError = true
        
        // When
        sutInteractor.fetchPhotoFromFirebase()
        
        // Then
        XCTAssertTrue(firebaseProfileHelper.invokesFetchProfilePhoto)
        XCTAssertFalse(firebaseProfileHelper.successfulFetchProfilePhoto)
        XCTAssertEqual(firebaseProfileHelper.invokesFetchProfilePhotoCount, 1)
        XCTAssertEqual(firebaseProfileHelper.successfulFetchProfilePhotoCount, 0)
        XCTAssertTrue(presenter.invokesDidFetchProfilePhotoFromInteractor)
        XCTAssertEqual(presenter.invokesDidFetchProfilePhotoFromInteractorCount, 1)
    }
    
    func test_fetchProfileDatas_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokesDidFetchProfileDatasFromInteractor)
        firebaseProfileHelper.fetchProfileDatasShouldReturnNil = false
        
        // When
        sutInteractor.fetchProfileDatas()
        
        // Then
        XCTAssertTrue(presenter.invokesDidFetchProfileDatasFromInteractor)
        XCTAssertEqual(presenter.invokesDidFetchProfileDatasFromInteractorCount, 1)
    }
    
    func test_fetchProfileDatas_WhenNotCreatedUserData_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokesDidFetchProfileDatasFromInteractor)
        firebaseProfileHelper.fetchProfileDatasShouldReturnNil = true
        
        // When
        sutInteractor.fetchProfileDatas()
        
        // Then
        XCTAssertFalse(presenter.invokesDidFetchProfileDatasFromInteractor)
        XCTAssertEqual(presenter.invokesDidFetchProfileDatasFromInteractorCount, 0)
    }
    
    func test_signOut_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseProfileHelper.invokesSignOut)
        XCTAssertFalse(presenter.invokedDidSignOut)
        
        // When
        sutInteractor.signOut()
        
        // Then
        XCTAssertTrue(firebaseProfileHelper.invokesSignOut)
        XCTAssertEqual(firebaseProfileHelper.invokesSignOutCount, 1)
        XCTAssertTrue(presenter.invokedDidSignOut)
        XCTAssertEqual(presenter.invokedDidSignOutCount, 1)
    }
}
