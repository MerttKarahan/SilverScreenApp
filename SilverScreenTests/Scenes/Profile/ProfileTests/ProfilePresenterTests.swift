//
//  ProfilePresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

import XCTest
@testable import SilverScreen

final class ProfilePresenterTests: XCTestCase {
    
    private var sutPresenter: ProfilePresenter!
    private var viewController: MockProfileViewController!
    private var interactor: MockProfileInteractor!
    private var router: MockProfileRouter!
    
    override func setUp() {
        super.setUp()
        self.viewController = .init()
        self.interactor = .init()
        self.router = .init()
        self.sutPresenter = .init(viewController: viewController, interactor: interactor, router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewController = nil
        self.interactor = nil
        self.router = nil
        self.sutPresenter = nil
    }
    
    func test_savePhotoToFirebaseFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(self.interactor.invokedSavePhotoToFirebase)
        let imageData = Data()
        // When
        sutPresenter.savePhotoToFirebaseFromInteractor(imageData: imageData)

        // Then
        XCTAssertTrue(self.interactor.invokedSavePhotoToFirebase)
        XCTAssertEqual(self.interactor.invokedSavePhotoToFirebaseCount, 1)
    }
    
    func test_fetchProfileDatasFromInteractor_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(self.interactor.invokedFetchPhotoFromFirebase)
        XCTAssertFalse(self.interactor.invokedFetchProfileDatas)
        
        // When
        sutPresenter.fetchProfileDatasFromInteractor()
        
        // Then
        XCTAssertTrue(self.interactor.invokedFetchPhotoFromFirebase)
        XCTAssertEqual(self.interactor.invokedFetchPhotoFromFirebaseCount, 1)
        XCTAssertTrue(self.interactor.invokedFetchProfileDatas)
        XCTAssertEqual(self.interactor.invokedFetchProfileDatasCount, 1)
    }
    
    func test_didFetchProfilePhotoFromInteractor_WhenImageIsNotNil_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(self.viewController.invokedDidFinishedFirebaseFetchingPhoto)
        let image = UIImage()
        
        // When
        sutPresenter.didFetchProfilePhotoFromInteractor(image: image, error: nil)
        
        // Then
        XCTAssertTrue(self.viewController.invokedDidFinishedFirebaseFetchingPhoto)
        XCTAssertEqual(self.viewController.invokedDidFinishedFirebaseFetchingPhotoCount, 1)
    }
    
    func test_didFetchProfilePhotoFromInteractor_WhenErrorIsNotNil_InvokesRequiredMethods() throws {
        // Given
        XCTAssertFalse(self.viewController.invokedDidFinishedFirebaseOperation)
        let error = NSError(domain: "", code: 1, userInfo: [:])

        // When
        sutPresenter.didFetchProfilePhotoFromInteractor(image: nil, error: error)

        // Then
        XCTAssertTrue(self.viewController.invokedDidFinishedFirebaseOperation)
        XCTAssertEqual(self.viewController.invokedDidFinishedFirebaseOperationCount, 1)
    }
    
    func test_didFetchProfileDatasFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedDidFinishedFetchingProfileDatas)
        let profileData = ProfileDatasModel(userId: "test", userMail: "test", accountCreatedDate: "test")

        // When
        sutPresenter.didFetchProfileDatasFromInteractor(datas: profileData)

        // Then
        XCTAssertTrue(viewController.invokedDidFinishedFetchingProfileDatas)
        XCTAssertEqual(viewController.invokedDidFİnishedFetchingProfileDatasCount, 1)
    }
    
    func test_didSavedPhotoToFirebase_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedDidFinishedFirebaseOperation)
        let message = "test"
        
        // When
        sutPresenter.didSavedPhotoToFirebase(message: message)
        
        // Then
        XCTAssertTrue(viewController.invokedDidFinishedFirebaseOperation)
        XCTAssertEqual(viewController.invokedDidFinishedFirebaseOperationCount, 1)
    }
    
    func test_converImageToData_ShouldReturnData() {
        // Given
        let image = UIImage()
        
        // When
        let data = sutPresenter.convertImageToData(image: image)
        
        // Then
        XCTAssertNil(data)
    }
    
    func test_didSignOut_WhenSuccessfulSignOut_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokeGoBackLoginViewController)
        let errorMessage: String? = nil
        // When
        sutPresenter.didSignOut(errorMessage: errorMessage)
        
        // Then
        XCTAssertTrue(router.invokeGoBackLoginViewController)
        XCTAssertEqual(router.invokeGoBackLoginViewControllerCount, 1)
    }
    
    func test_didSignOut_WhenFailureSignOut_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedDidFinishedFirebaseOperation)
        let errorMessage: String? = "test"
        
        // When
        sutPresenter.didSignOut(errorMessage: errorMessage)
        
        // Then
        XCTAssertTrue(viewController.invokedDidFinishedFirebaseOperation)
        XCTAssertEqual(viewController.invokedDidFinishedFirebaseOperationCount, 1)
    }
    
    func test_goBackLoginViewControllerWithLogout_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedSignOut)
        
        // When
        sutPresenter.goBackLoginViewControllerWithLogout()
        
        // Then
        XCTAssertTrue(interactor.invokedSignOut)
        XCTAssertEqual(interactor.invokedSignOutCount, 1)
    }
}
