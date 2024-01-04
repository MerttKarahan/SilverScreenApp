//
//  HomeInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 27.12.2023.
//

@testable import SilverScreen
import XCTest

final class HomeInteractorTests: XCTestCase {
    
    private var sutInteractor: HomeInteractor!
    private var presenter: MockHomePresenter!
    private var api: MockMoviesTVShowsAPI!
    
    override func setUp() {
        super.setUp()
        self.api = .init()
        self.presenter = .init()
        self.sutInteractor = .init(apiProtocol: api)
        sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.api = nil
        self.presenter = nil
        self.sutInteractor = nil
    }
    
    func test_getPopularMovies_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getPopularMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 1)
    }
    
    func test_getPopularMovies_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getPopularMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 0)
    }
    
    func test_getTrendingMovies_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getTrendingMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 1)
    }
    
    func test_getTrendingMovies_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getTrendingMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 0)
    }
    
    func test_getTopRatedMovies_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getTopRatedMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 1)
    }
    
    func test_getTopRatedMovies_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getTopRatedMovies(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 0)
    }
    
    func test_getUpcomingMovies_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getUpcomingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 1)
    }
    
    func test_getUpcomingMovies_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovies)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getUpcomingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMovieItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMovieItemsFromInteractorCount, 0)
    }
    
    func test_getPopularTVShows_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getPopularTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 1)
    }
    
    func test_getPopularTVShows_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getPopularTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 0)
    }
    
    func test_getTrendingTVShows_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getTrendingTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 1)
    }
    
    func test_getTrendingTVShows_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getTrendingTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 0)
    }
    
    func test_getTopRatedTVShows_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getTopRatedTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 1)
    }
    
    func test_getTopRatedTVShows_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTVShows)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getTopRatedTVShows(page: 1)
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchTVShowItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowItemsFromInteractorCount, 0)
    }
}
