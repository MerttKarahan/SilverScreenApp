//
//  ProfileViewControllerTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

import XCTest
@testable import SilverScreen

final class ProfileViewControllerTests: XCTestCase {
    
    private var sutViewController: ProfileViewController!
    private var presenter: MockProfilePresenter!
    
    override func setUp() {
        super.setUp()
        self.sutViewController = ProfileViewController()
        self.presenter = .init()
        self.sutViewController.presenter = presenter
        sutViewController.loadViewIfNeeded()
    }

    override func tearDown() {
        super.tearDown()
        self.sutViewController = nil
        self.presenter = nil
    }
    
    func test_IBOutlets_WhenCreated_HasRequiredValues() throws {
        // Given
        let userIdTitleLabel = try XCTUnwrap(sutViewController.userIdTitleLabel)
        let userCreatedDateTitleLabel = try XCTUnwrap(sutViewController.userCreatedDateTitleLabel)
        let userMailTitleLabel = try XCTUnwrap(sutViewController.userMailTitleLabel)
        let profileDetailsView = try XCTUnwrap(sutViewController.profileDetailsView)
        let profileDetailsHolderView = try XCTUnwrap(sutViewController.profileDetailsHolderView)
        
        // Then
        XCTAssertEqual(userIdTitleLabel.text, "User ID: ")
        XCTAssertEqual(userCreatedDateTitleLabel.text, "Account Created Date: ")
        XCTAssertEqual(userMailTitleLabel.text, "Mail: ")
        XCTAssertNotNil(profileDetailsView)
        XCTAssertNotNil(profileDetailsHolderView)
    }
    
    func testViewController_WhenCreated_HasAddPhotoButtonAndAction_HasLogoutButtonAndAction() throws {
        // Given
        let addPhotoButton = try XCTUnwrap(sutViewController.addPhotoButton)
        let logoutButton = try XCTUnwrap(sutViewController.logoutButton)
        
        // When
        let addPhotoButtonActions = try XCTUnwrap(addPhotoButton.actions(forTarget: sutViewController, forControlEvent:.touchUpInside))
        let logoutButtonActions = try XCTUnwrap(logoutButton.actions(forTarget: sutViewController, forControlEvent:.touchUpInside))
        
        // Then
        XCTAssertEqual(addPhotoButtonActions.count, 1)
        XCTAssertEqual(addPhotoButtonActions.first, "addPhotoButtonTapped:")
        XCTAssertEqual(logoutButtonActions.count, 1)
        XCTAssertEqual(logoutButtonActions.first, "logoutButtonTapped:")
    }
    
    func test_logoutButtonTapped_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokesGoBackLoginViewControllerWithLogout)
        
        // When
        sutViewController.logoutButton.sendActions(for: .touchUpInside)
        
        // Then
        XCTAssertTrue(presenter.invokesGoBackLoginViewControllerWithLogout)
        XCTAssertEqual(presenter.invokesGoBackLoginViewControllerWithLogoutCount, 1)
    }
    
    func test_wiewWillAppear_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokesFetchProfileDatasFromInteractor)
        
        // When
        sutViewController.viewWillAppear(true)
        
        // Then
        XCTAssertTrue(presenter.invokesFetchProfileDatasFromInteractor)
        XCTAssertEqual(presenter.invokesFetchProfileDatasFromInteractorCount, 1)
    }
    
    func test_didFinishedFirebaseFetchingPhoto_WhenTriggered_ProfileImageViewShouldNotBeNil() throws {
        // Given
        let profileImageView = try XCTUnwrap(sutViewController.profileImageView)
        let image = UIImage()
        
        // When
        sutViewController.didFinishedFirebaseFetchingPhoto(image: image)
        
        // Then
        XCTAssertEqual(profileImageView.image, image)
    }
    
    func test_didFinishedFetchingProfileDatas_WhentTriggered_UserIdLabel_UserMailLabel_UserCreatedDateLabel_ShouldNotBeNil() throws {
        // Given
        let userIdLabel = try XCTUnwrap(sutViewController.userIdLabel)
        let userMailLabel = try XCTUnwrap(sutViewController.userMailLabel)
        let userCreatedDateLabel = try XCTUnwrap(sutViewController.userCreatedDateLabel)
        let profileDatas = ProfileDatasModel(userId: "test", userMail: "test", accountCreatedDate: "2023/11/14")
        
        // When
        sutViewController.didFinishedFetchingProfileDatas(datas: profileDatas)
        
        // Then
        XCTAssertEqual(userIdLabel.text, profileDatas.userId)
        XCTAssertEqual(userMailLabel.text, profileDatas.userMail)
        XCTAssertEqual(userCreatedDateLabel.text, profileDatas.accountCreatedDate?.convertToReadableDateString(responseDate: "yyyy-MM-dd HH:mm:ss Z", displayDate: "dd/MM/yyyy HH:mm"))
    }
}
