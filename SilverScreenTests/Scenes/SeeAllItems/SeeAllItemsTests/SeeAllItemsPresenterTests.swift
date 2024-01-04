//
//  SeeAllItemsPresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen
import XCTest

final class SeeAllItemsPresenterTests: BaseXCTestCase {
    private var sutPresenter: SeeAllItemsPresenter!
    private var interactor: MockSeeAllItemsInteractor!
    private var viewController: MockSeeAllItemsViewController!
    private var router: MockSeeAllItemsRouter!
    
    private var page: Int?
    private var itemType: ItemType?
    private var collectionView: HomeViewCollectionViews?
    
    override func setUp() {
        super.setUp()
        self.interactor = .init()
        self.viewController = .init()
        self.router = .init()
        self.sutPresenter = .init(viewController: viewController, interactor: interactor, router: router, existItems: [], page: nil, itemType: nil, collectionView: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        self.router = nil
        self.viewController = nil
        self.interactor = nil
        self.sutPresenter = nil
        
        self.page = nil
        self.itemType = nil
        self.collectionView = nil
    }
    
    func test_getPopularItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetPopularMovies)
        sutPresenter.itemType = .movie
        
        // When
        sutPresenter.getPopularItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetPopularMovies)
        XCTAssertEqual(interactor.invokedGetPopularMoviesCount, 1)
    }
    
    func test_getPopularItemsFromInteractor_WhenItemTypeTvShow_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetPopularTVShows)
        sutPresenter.itemType = .tvShow
        
        // When
        sutPresenter.getPopularItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetPopularTVShows)
        XCTAssertEqual(interactor.invokedGetPopularTVShowsCount, 1)
    }
    
    func test_getPopularItemsFromInteractor_WhenItemTypeNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetPopularMovies)
        XCTAssertFalse(interactor.invokedGetPopularTVShows)
        sutPresenter.itemType = nil
        
        // When
        sutPresenter.getPopularItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertFalse(interactor.invokedGetPopularMovies)
        XCTAssertFalse(interactor.invokedGetPopularTVShows)
        XCTAssertEqual(interactor.invokedGetPopularTVShowsCount, 0)
        XCTAssertEqual(interactor.invokedGetPopularMoviesCount, 0)
    }
    
    func test_getTopRatedItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTopRatedMovies)
        sutPresenter.itemType = .movie
        
        // When
        sutPresenter.getTopRatedItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTopRatedMovies)
        XCTAssertEqual(interactor.invokedGetTopRatedMoviesCount, 1)
    }
    
    func test_getTopRatedItemsFromInteractor_WhenItemTypeTvShow_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTopRatedTVShows)
        sutPresenter.itemType = .tvShow
        
        // When
        sutPresenter.getTopRatedItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTopRatedTVShows)
        XCTAssertEqual(interactor.invokedGetTopRatedTVShowsCount, 1)
    }
    
    func test_getTopRatedItemsFromInteractor_WhenItemTypeNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTopRatedMovies)
        XCTAssertFalse(interactor.invokedGetPopularTVShows)
        sutPresenter.itemType = nil
        
        // When
        sutPresenter.getTopRatedItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertFalse(interactor.invokedGetTopRatedMovies)
        XCTAssertFalse(interactor.invokedGetTopRatedTVShows)
        XCTAssertEqual(interactor.invokedGetTopRatedTVShowsCount, 0)
        XCTAssertEqual(interactor.invokedGetTopRatedMoviesCount, 0)
    }
    
    func test_getTrendingItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTrendingMovies)
        sutPresenter.itemType = .movie
        
        // When
        sutPresenter.getTrendingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTrendingMovies)
        XCTAssertEqual(interactor.invokedGetTrendingMoviesCount, 1)
    }
    
    func test_getTrendingItemsFromInteractor_WhenItemTypeTvShow_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTrendingTVShows)
        sutPresenter.itemType = .tvShow
        
        // When
        sutPresenter.getTrendingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTrendingTVShows)
        XCTAssertEqual(interactor.invokedGetTrendingTVShowsCount, 1)
    }
    
    func test_getTrendingItemsFromInteractor_WhenItemTypeNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetTrendingMovies)
        XCTAssertFalse(interactor.invokedGetTrendingTVShows)
        sutPresenter.itemType = nil
        
        // When
        sutPresenter.getTrendingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertFalse(interactor.invokedGetTrendingMovies)
        XCTAssertFalse(interactor.invokedGetTrendingTVShows)
        XCTAssertEqual(interactor.invokedGetTrendingTVShowsCount, 0)
        XCTAssertEqual(interactor.invokedGetTrendingMoviesCount, 0)
    }
    
    func test_getUpcomingItemsFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetUpcomingMovies)
        
        // When
        sutPresenter.getUpcomingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetUpcomingMovies)
        XCTAssertEqual(interactor.invokedGetUpcomingMoviesCount, 1)
    }
    
    func test_setupNavigationBarTitle_WhenHasRequiredItemTypeAndCollectionView_ShouldNotReturnNil() {
        // Given
        sutPresenter.itemType = .movie
        sutPresenter.collectionView = .popularItemsCollectionView
        
        // Then
        XCTAssertNotNil(sutPresenter.setupNavigationBarTitle())
    }
    
    func test_setupNavigationBarTitle_WhenHasNotRequiredItemTypeAndCollectionView_ShouldReturnNil() {
        // Given
        sutPresenter.itemType = nil
        sutPresenter.collectionView = nil
        
        // Then
        XCTAssertEqual(sutPresenter.setupNavigationBarTitle(), "")
    }
    
    func test_didFetchTVShowsItemsFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createTVShowsItemResult(numberOfItems: 1)
        
        // When
        sutPresenter.didFetchTVShowsItemsFromInteractor(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchTVShowsItemsFromInteractor_WhenResultsArrayOfTVShowsItemsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createTVShowsItemResult(page: 1)
        
        // When
        sutPresenter.didFetchTVShowsItemsFromInteractor(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchMoviesItemsFromInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createMoviesItemResult(page: 1, numberOfItems: 1)
        
        // When
        sutPresenter.didFetchMoviesItemsFromInteractor(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_didFetchMoviesItemsFromInteractor_WhenResultsArrayOfMoviesItemsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionView)
        let model = unitTestHelper.createMoviesItemResult(page: 1)
        
        // When
        sutPresenter.didFetchMoviesItemsFromInteractor(model: model)
        
        // Then
        XCTAssertTrue(viewController.invokedUpdateCollectionView)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewCount, 1)
    }
    
    func test_goBackHomeViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedGoBack)
        
        // When
        sutPresenter.goBackHomeViewController()
        
        // Then
        XCTAssertTrue(router.invokedGoBack)
        XCTAssertEqual(router.invokedGoBackCount, 1)
    }
    
    func test_pushToDetailsViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushDetailsViewController)
        
        // When
        sutPresenter.pushToDetailsViewController(id: "", itemType: .movie)
        
        // Then
        XCTAssertTrue(router.invokedPushDetailsViewController)
        XCTAssertEqual(router.invokedPushDetailsViewControllerCount, 1)
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
