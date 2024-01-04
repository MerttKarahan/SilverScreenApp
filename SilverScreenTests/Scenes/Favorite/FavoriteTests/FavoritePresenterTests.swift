//
//  FavoritePresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

import XCTest
@testable import SilverScreen

final class FavoritePresenterTests: BaseXCTestCase {
    private var sutPresenter: FavoritesPresenter!
    private var viewController: MockFavoriteViewController!
    private var interactor: MockFavoriteInteractor!
    private var router: MockFavoriteRouter!
    
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
    
    func test_numberOfItems_ShouldReturnCountOfArray() {
        // Given
        sutPresenter.favoriteItems = unitTestHelper.createFavoritesModel(numberOfItems: 2)
        
        // Then
        XCTAssertEqual(sutPresenter.numberOfItems, 2)
    }
    
    func test_getCellModel_ShouldReturnFavoritesModelArrayItem() {
        // Given
        sutPresenter.favoriteItems = unitTestHelper.createFavoritesModel(numberOfItems: 2)
        
        // Then
        XCTAssertNotNil(sutPresenter.getCellModel(at: .zero))
    }
    
    func test_fetchFavoriteDatasFromInteractor_WhenHasItemType_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedFetchFavoriteDatasFromFirebase)
        
        // When
        sutPresenter.fetchFavoriteDatasFromInteractor()
        
        // Then
        XCTAssertTrue(interactor.invokedFetchFavoriteDatasFromFirebase)
        XCTAssertEqual(interactor.invokedFetchFavoriteDatasFromFirebaseCount, 1)
    }
    
    func test_fetchFavoriteDatasFromInteractor_WhenItemTypeNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedFetchFavoriteDatasFromFirebase)
        sutPresenter.itemType = nil
        
        // When
        sutPresenter.fetchFavoriteDatasFromInteractor()
        
        // Then
        XCTAssertFalse(interactor.invokedFetchFavoriteDatasFromFirebase)
        XCTAssertEqual(interactor.invokedFetchFavoriteDatasFromFirebaseCount, 0)
    }
    
    func test_deleteFavoriteDatasFromInteractor_WhenHasRequiredVariables_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedDeleteFavoriteDatasFromFirebase)

        // When
            // willDeletedItems didSet method trigger deleteFavoriteDatasFromInteractor
        sutPresenter.willDeletedItem = .init(itemId: "1", title: "test", imageURL: "test")
        
        // Then
        XCTAssertTrue(interactor.invokedDeleteFavoriteDatasFromFirebase)
        XCTAssertEqual(interactor.invokedDeleteFavoriteDatasFromFirebaseCount, 1)
    }
    
    func test_deleteFavoriteDatasFromInteractor_WhenHasNotRequiredVariables_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedDeleteFavoriteDatasFromFirebase)
        
        // When
        sutPresenter.deleteFavoriteDatasFromInteractor()
        
        // Then
        XCTAssertFalse(interactor.invokedDeleteFavoriteDatasFromFirebase)
        XCTAssertEqual(interactor.invokedDeleteFavoriteDatasFromFirebaseCount, 0)
    }
    
    func test_didDeleteFavoriteDatasFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedDidDeletedItem)
        let errorMessage: String = "test"
        
        // When
        sutPresenter.didDeleteFavoriteDatasFromInteractor(message: errorMessage)
        
        // Then
        XCTAssertTrue(viewController.invokedDidDeletedItem)
        XCTAssertEqual(viewController.invokedDidDeletedItemCount, 1)
    }
    
    func test_didFetchFavoriteDatasFromInteractor_InvokesRequiredMethodAndFillRequiredArray() {
        // Given
        XCTAssertFalse(viewController.invokedReloadTableView)
        XCTAssertEqual(sutPresenter.favoriteItems.count, 0)
        let favorites = unitTestHelper.createFavoritesModel(numberOfItems: 2)
        
        // When
        sutPresenter.didFetchFavoriteDatasFromInteractor(favorites: favorites)
        
        // Then
        XCTAssertNotEqual(sutPresenter.favoriteItems.count, 0)
        XCTAssertTrue(viewController.invokedReloadTableView)
        XCTAssertEqual(viewController.invokedReloadTableViewCount, 1)
    }
    
    func test_pushToDetailViewController_WhenHasRequiredVariables_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushToDetailViewController)
        
        // When
        sutPresenter.pushToDetailViewController(id: "test")
        
        // Then
        XCTAssertTrue(router.invokedPushToDetailViewController)
        XCTAssertEqual(router.invokedPushToDetailViewControllerCount, 1)
    }
    
    func test_pushToDetailViewController_WhenHasNotRequiredVariables_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushToDetailViewController)
        sutPresenter.itemType = nil
        
        // When
        sutPresenter.pushToDetailViewController(id: "test")
        
        // Then
        XCTAssertFalse(router.invokedPushToDetailViewController)
        XCTAssertEqual(router.invokedPushToDetailViewControllerCount, 0)
    }
}
