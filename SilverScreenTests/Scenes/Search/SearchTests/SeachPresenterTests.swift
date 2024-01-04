//
//  SeachPresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen
import XCTest

final class SeachPresenterTests: BaseXCTestCase {
    private var sutPresenter: SearchPresenter!
    private var viewController: MockSearchViewController!
    private var interactor: MockSearchInteractor!
    private var router: MockSearchRouter!
    
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
    
    func test_numberOfItems_ShouldReturnCountOfMovieArray() {
        // Given
        sutPresenter.itemType = .movie
        sutPresenter.searchedMovies = nil
        
        // Then
        XCTAssertEqual(sutPresenter.numberOfItems, 0)
    }
    
    func test_numberOfItems_ShouldReturnCountOfTvShowsArray() {
        // Given
        sutPresenter.itemType = .tvShow
        sutPresenter.searchedTVShows = nil
        
        // Then
        XCTAssertEqual(sutPresenter.numberOfItems, 0)
    }
    
    func test_didFetchSearchedMoviesItems_WhenResultsEmpty_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createMoviesItemResult(results: [])
        sutPresenter.searchedMovies = []
        // When
        sutPresenter.didFetchSearchedMoviesItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchSearchedMoviesItems_WhenResultsNotEmptyAndSearchedMoviesNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createMoviesItemResult()
        sutPresenter.searchedMovies = unitTestHelper.createMovieItemsArray()
        
        // When
        sutPresenter.didFetchSearchedMoviesItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchSearchedMoviesItems_WhenResultsEmptyAndSearchedMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createMoviesItemResult(numberOfItems: 1)
        sutPresenter.searchedMovies = nil
        // When
        sutPresenter.didFetchSearchedMoviesItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchSearchedTVShowsItems_WhenResultsEmpty_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createTVShowsItemResult(results: [])
        sutPresenter.searchedTVShows = []
        // When
        sutPresenter.didFetchSearchedTVShowsItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchSearchedTVShowsItems_WhenResultsNilAndSearchedMoviesNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createTVShowsItemResult()
        sutPresenter.searchedTVShows = unitTestHelper.createTVShowItemsArray(numberOfItems: 1)
        
        // When
        sutPresenter.didFetchSearchedTVShowsItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchSearchedTVShowsItems_WhenResultsEmptyAndSearchedMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createTVShowsItemResult(numberOfItems: 1)
        sutPresenter.searchedTVShows = nil
        // When
        sutPresenter.didFetchSearchedTVShowsItems(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_pushToDetailsViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushToDetailsViewController)
        
        // When
        sutPresenter.pushToDetailsViewController(id: "", itemType: .movie)
        
        // Then
        XCTAssertTrue(router.invokedPushToDetailsViewController)
        XCTAssertEqual(router.invokedPushToDetailsViewControllerCount, 1)
    }
    
    func test_getSearchedItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetSearchedMovies)
        sutPresenter.itemType = .movie
        
        // When
        sutPresenter.key = nil
        
        // Then
        XCTAssertTrue(interactor.invokedGetSearchedMovies)
        XCTAssertEqual(interactor.invokedGetSearchedMoviesCount, 1)
    }
    
    func test_getSearchedItemsFromInteractor_WhenItemTypeTVShow_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetSearchedTVShows)
        sutPresenter.itemType = .tvShow
        
        // When
        sutPresenter.key = nil
        
        // Then
        XCTAssertTrue(interactor.invokedGetSearchedTVShows)
        XCTAssertEqual(interactor.invokedGetSearchedTVShowsCount, 1)
    }
    
    func test_showAlert_InvokesReuqiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedShowAlert)
        
        // When
        sutPresenter.showAlertView(message: "test")
        
        // Then
        XCTAssertTrue(viewController.invokedShowAlert)
        XCTAssertEqual(viewController.invokedShowAlertCount, 1)
    }
}
