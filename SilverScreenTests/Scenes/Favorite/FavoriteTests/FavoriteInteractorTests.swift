//
//  FavoriteInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

import XCTest
@testable import SilverScreen

final class FavoriteInteractorTests: XCTestCase {
    private var sutInteractor: FavoritesInteractor!
    private var presenter: MockFavoritePresenter!
    private var firebaseHelperReadingWritingHelper: MockFirebaseHelperReadingWritingHelper!
    
    override func setUp() {
        super.setUp()
        self.presenter = .init()
        self.firebaseHelperReadingWritingHelper = .init()
        self.sutInteractor = .init(firebaseHelperReadingWritingProtocol: firebaseHelperReadingWritingHelper)
        sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.presenter = nil
        self.sutInteractor = nil
        self.firebaseHelperReadingWritingHelper = nil
    }
    
    func test_fetchFavoriteDatasFromFirebase_WhenTypeIsMovieAndHasMovieArray_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.movieItems = [FavoritesModel(itemId: "1", title: "test", imageURL: "test"), FavoritesModel(itemId: "1", title: "test", imageURL: "test")]

        // When
        sutInteractor.fetchFavoriteDatasFromFirebase(itemType: .movie)

        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchFavoriteDatasFromInteractorCount, 1)
    }
    
    func test_fetchFavoriteDatasFromFirebase_WhenTypeIsMovieAndHasNotMovieArray_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.movieItems = nil

        // When
        sutInteractor.fetchFavoriteDatasFromFirebase(itemType: .movie)

        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchFavoriteDatasFromInteractorCount, 0)
    }
    
    func test_fetchFavoriteDatasFromFirebase_WhenTypeIsTvShowAndHasTvShowArray_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.tvShowItems = [FavoritesModel(itemId: "1", title: "test", imageURL: "test"), FavoritesModel(itemId: "1", title: "test", imageURL: "test")]

        // When
        sutInteractor.fetchFavoriteDatasFromFirebase(itemType: .tvShow)

        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchFavoriteDatasFromInteractorCount, 1)
    }
    
    func test_fetchFavoriteDatasFromFirebase_WhenTypeIsTvShowAndHasNotTvShowArray_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.tvShowItems = nil

        // When
        sutInteractor.fetchFavoriteDatasFromFirebase(itemType: .tvShow)

        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFetchFavoriteDatasFromInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchFavoriteDatasFromInteractorCount, 0)
    }
    
    func test_deleteFavoriteDatasFromFirebase_WhenSuccessfulDeleteOperation_ShouldInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidDeleteFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.deleteDataFromFirebaseShouldReturnError = false
        
        // When
        sutInteractor.deleteFavoriteDatasFromFirebase(itemId: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidDeleteFavoriteDatasFromInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidDeleteFavoriteDatasFromInteractorCount, 1)
    }
    
    func test_deleteFavoriteDatasFromFirebase_WhenFailureDeleteOperation_ShouldInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidDeleteFavoriteDatasFromInteractor)
        firebaseHelperReadingWritingHelper.deleteDataFromFirebaseShouldReturnError = true
        
        // When
        sutInteractor.deleteFavoriteDatasFromFirebase(itemId: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebaseCount, 1)
        XCTAssertTrue(presenter.invokedDidDeleteFavoriteDatasFromInteractor)
        XCTAssertEqual(presenter.invokedDidDeleteFavoriteDatasFromInteractorCount, 1)
    }
}
