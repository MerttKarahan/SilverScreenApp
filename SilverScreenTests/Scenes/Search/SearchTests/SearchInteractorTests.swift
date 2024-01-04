//
//  SearchInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen
import XCTest

final class SearchInteractorTests: XCTestCase {
    var sutInteractor: SearchInteractor!
    var presenter: MockSearchPresenter!
    var api: MockMoviesTVShowsSearchedAPI!
    
    override func setUp() {
        super.setUp()
        self.api = .init()
        self.sutInteractor = .init(apiProtocol: api)
        self.presenter = .init()
        sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.api = nil
        self.sutInteractor = nil
        self.presenter = nil
    }
    
    func test_getSearchedMovies_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSearchedMovies)
        XCTAssertFalse(presenter.invokedDidFetchSearchedMoviesItems)
        api.getSearchedMoviesShouldReturnError = false
        
        // When
        sutInteractor.getSearchedMovies(key: "test")
        
        // Then
        XCTAssertTrue(api.invokedGetSearchedMovies)
        XCTAssertEqual(api.invokedGetSearchedMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchSearchedMoviesItems)
        XCTAssertEqual(presenter.invokedDidFetchSearchedMoviesItemsCount, 1)
    }
    
    func test_getSearchedMovies_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSearchedMovies)
        XCTAssertFalse(presenter.invokedDidFetchSearchedMoviesItems)
        api.getSearchedMoviesShouldReturnError = true
        
        // When
        sutInteractor.getSearchedMovies(key: "test")
        
        // Then
        XCTAssertTrue(api.invokedGetSearchedMovies)
        XCTAssertFalse(presenter.invokedDidFetchSearchedMoviesItems)
        XCTAssertEqual(presenter.invokedDidFetchSearchedMoviesItemsCount, 0)
        XCTAssertEqual(api.invokedGetSearchedMoviesCount, 1)
    }
    
    func test_getSearchedTVShows_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSearchedTVShow)
        XCTAssertFalse(presenter.invokedDidFetchSearchedTVShowsItems)
        api.getSearchedTVShowShouldReturnError = false
        
        // When
        sutInteractor.getSearchedTVShows(key: "test")
        
        // Then
        XCTAssertTrue(api.invokedGetSearchedTVShow)
        XCTAssertTrue(presenter.invokedDidFetchSearchedTVShowsItems)
        XCTAssertEqual(presenter.invokedDidFetchSearchedTVShowsItemsCount, 1)
        XCTAssertEqual(api.invokedGetSearchedTVShowCount, 1)
    }
    
    func test_getSearchedTVShows_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSearchedTVShow)
        XCTAssertFalse(presenter.invokedDidFetchSearchedTVShowsItems)
        api.getSearchedTVShowShouldReturnError = true
        
        // When
        sutInteractor.getSearchedTVShows(key: "test")
        
        // Then
        XCTAssertTrue(api.invokedGetSearchedTVShow)
        XCTAssertEqual(api.invokedGetSearchedTVShowCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchSearchedTVShowsItems)
        XCTAssertEqual(presenter.invokedDidFetchSearchedTVShowsItemsCount, 0)
    }
}
