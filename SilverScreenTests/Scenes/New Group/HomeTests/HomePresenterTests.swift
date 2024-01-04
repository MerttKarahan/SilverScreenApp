//
//  HomePresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 27.12.2023.
//

@testable import SilverScreen
import XCTest

final class HomePresenterTests: BaseXCTestCase {
    
    private var sutPresenter: HomePresenter!
    private var viewController: MockHomeViewController!
    private var interactor: MockHomeInteractor!
    private var router: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        self.viewController = .init()
        self.interactor = .init()
        self.router = .init()
        self.sutPresenter = .init(interactor: interactor, router: router, view: viewController)
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewController = nil
        self.router = nil
        self.interactor = nil
        self.sutPresenter = nil
    }
    
    func test_selectedRandomTVShowTrendItem_ShouldNotReturnNil() {
        // Given
        self.sutPresenter.trendingTVShows = unitTestHelper.createTVShowItemsArray()
        
        // When
        let element = sutPresenter.selectedRandomTVShowTrendItem
        
        // Then
        XCTAssertNotNil(element)
    }
    
    func test_selectedRandomMovieTrendItem_ShouldNotReturnNil() {
        // Given
        self.sutPresenter.trendingMovies = unitTestHelper.createMovieItemsArray()
        
        // When
        let element = sutPresenter.selectedRandomMovieTrendItem
        
        // Then
        XCTAssertNotNil(element)
    }
    
    func test_getPopularItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .movie
        XCTAssertFalse(interactor.invokedGetPopularMovies)
        
        // When
        sutPresenter.getPopularItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetPopularMovies)
        XCTAssertEqual(interactor.invokedGetPopularMoviesCount, 1)
    }
    
    func test_getPopularItemsFromInteractor_WhenItemTypeTVShow_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .tvShow
        XCTAssertFalse(interactor.invokedGetPopularTVShows)
        
        // When
        sutPresenter.getPopularItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetPopularTVShows)
        XCTAssertEqual(interactor.invokedGetPopularTVShowsCount, 1)
    }
    
    func test_getTopRatedItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .movie
        XCTAssertFalse(interactor.invokedGetTopRatedMovies)
        
        // When
        sutPresenter.getTopRatedItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTopRatedMovies)
        XCTAssertEqual(interactor.invokedGetTopRatedMoviesCount, 1)
    }
    
    func test_getTopRatedItemsFromInteractor_WhenItemTypeTVShow_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .tvShow
        XCTAssertFalse(interactor.invokedGetTopRatedTVShow)
        
        // When
        sutPresenter.getTopRatedItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTopRatedTVShow)
        XCTAssertEqual(interactor.invokedGetTopRatedTVShowCount, 1)
    }
    
    func test_getTrendingItemsFromInteractor_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .movie
        XCTAssertFalse(interactor.invokedGetTrendingMovies)
        
        // When
        sutPresenter.getTrendingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTrendingMovies)
        XCTAssertEqual(interactor.invokedGetTrendingMoviesCount, 1)
    }
    
    func test_getTrendingItemsFromInteractor_WhenItemTypeTVShow_InvokesRequiredMethod() {
        // Given
        sutPresenter.segmentedControllType = .tvShow
        XCTAssertFalse(interactor.invokedGetTrendingTVShows)
        
        // When
        sutPresenter.getTrendingItemsFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetTrendingTVShows)
        XCTAssertEqual(interactor.invokedGetTrendingTVShowsCount, 1)
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
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetPopularMovies_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.popularMovies = [MoviesItem()]
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getPopularMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.popularMovies?.count, 1)
        XCTAssertEqual(sutPresenter.popularMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetPopularMoviesAndPopularMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.popularMovies = nil
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getPopularMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.popularMovies, model.results)
        XCTAssertEqual(sutPresenter.popularMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetTopRatedMovies_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.topRatedMovies = [MoviesItem()]
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getTopRatedMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.topRatedMovies?.count, 1)
        XCTAssertEqual(sutPresenter.topRatedMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetTopRatedMoviesAndPopularMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.topRatedMovies = nil
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getTopRatedMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.topRatedMovies, model.results)
        XCTAssertEqual(sutPresenter.topRatedMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetTrendingMovies_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.trendingMovies = [MoviesItem()]
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getTrendingMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.trendingMovies?.count, 1)
        XCTAssertEqual(sutPresenter.trendingMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetTrendingMoviesAndPopularMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.trendingMovies = nil
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getTrendingMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.trendingMovies, model.results)
        XCTAssertEqual(sutPresenter.trendingMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetUpcomingMovies_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.upcomingMovies = [MoviesItem()]
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getUpcomingMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.upcomingMovies?.count, 1)
        XCTAssertEqual(sutPresenter.upcomingMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchMovieItemsFromInteractor_WhenEndPointGetUpcomingMoviesAndUpcomingMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createMoviesItemResult()
        sutPresenter.upcomingMovies = nil
        
        // When
        sutPresenter.didFetchMovieItemsFromInteractor(model: model, endpoint: .getUpcomingMovies)
        
        // Then
        XCTAssertEqual(sutPresenter.upcomingMovies, model.results)
        XCTAssertEqual(sutPresenter.upcomingMoviesPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetPopularTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.popularTVShows = [TVShowsItem()]
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getPopularTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.popularTVShows?.count, 1)
        XCTAssertEqual(sutPresenter.popularTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetPopularTVShowsAndPopularTVShowsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.popularTVShows = nil
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getPopularTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.popularTVShows, model.results)
        XCTAssertEqual(sutPresenter.popularTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetTopRatedTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.topRatedTVShows = [TVShowsItem()]
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getTopRatedTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.topRatedTVShows?.count, 1)
        XCTAssertEqual(sutPresenter.topRatedTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetTopRatedTVShowsAndTopRatedTVShowsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.topRatedTVShows = nil
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getTopRatedTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.topRatedTVShows, model.results)
        XCTAssertEqual(sutPresenter.topRatedTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetTrendingTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.trendingTVShows = [TVShowsItem()]
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getTrendingTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.trendingTVShows?.count, 1)
        XCTAssertEqual(sutPresenter.trendingTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_didFetchTVShowItemsFromInteractor_WhenEndPointGetTrendingTVShowsAndTrendingTVShowsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedUpdateCollectionViews)
        let model = self.unitTestHelper.createTVShowsItemResult()
        sutPresenter.trendingTVShows = nil
        
        // When
        sutPresenter.didFetchTVShowItemsFromInteractor(model: model, endpoint: .getTrendingTVShows)
        
        // Then
        XCTAssertEqual(sutPresenter.trendingTVShows, model.results)
        XCTAssertEqual(sutPresenter.trendingTVShowsPage, model.page)
        XCTAssertTrue(viewController.invokedUpdateCollectionViews)
        XCTAssertEqual(viewController.invokedUpdateCollectionViewsCount, 1)
    }
    
    func test_pushToSeeAllViewControllerPopularItems_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .movie
        
        // When
        sutPresenter.pushToSeeAllViewControllerPopularItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerPopularItems_WhenItemTypeTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .tvShow
        
        // When
        sutPresenter.pushToSeeAllViewControllerPopularItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerTrendingItems_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .movie
        
        // When
        sutPresenter.pushToSeeAllViewControllerTrendingItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerTrendingItems_WhenItemTypeTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .tvShow
        
        // When
        sutPresenter.pushToSeeAllViewControllerTrendingItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerTopRatedItems_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .movie
        
        // When
        sutPresenter.pushToSeeAllViewControllerTopRatedItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerTopRatedItems_WhenItemTypeTVShows_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        sutPresenter.segmentedControllType = .tvShow
        
        // When
        sutPresenter.pushToSeeAllViewControllerTopRatedItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToSeeAllViewControllerUpcomingItems_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedpushToSeeAllItemsViewController)
        
        // When
        sutPresenter.pushToSeeAllViewControllerUpcomingItems()
        
        // Then
        XCTAssertTrue(router.invokedpushToSeeAllItemsViewController)
        XCTAssertEqual(router.invokedpushToSeeAllItemsViewControllerCount, 1)
    }
    
    func test_pushToDetailsViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushToDetailsViewController)
        
        // When
        sutPresenter.pushToDetailsViewController(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(router.invokedPushToDetailsViewController)
        XCTAssertEqual(router.invokedPushToDetailsViewControllerCount, 1)
    }
    
    func test_showAlertView_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedShowAlert)
        
        // When
        sutPresenter.showAlertView(message: "test")
        
        // Then
        XCTAssertTrue(viewController.invokedShowAlert)
        XCTAssertEqual(viewController.invokedShowAlertCount, 1)
    }
}
