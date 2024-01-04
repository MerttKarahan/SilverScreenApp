//
//  SeeAllItemsInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen
import XCTest

final class SeeAllItemsInteractorTests: XCTestCase {
    private var sutInteractor: SeeAllItemsInteractor!
    private var presenter: MockSeeAllItemsPresenter!
    private var api: MockMoviesTVShowsAPI!
    
    override func setUp() {
        super.setUp()
        self.presenter = .init()
        self.api = .init()
        self.sutInteractor = .init(apiProtocol: api)
        self.sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.sutInteractor = nil
        self.presenter = nil
        self.api = nil
    }
    
    func test_getPopularMovies_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getPopularMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 1)
    }
    
    func test_getPopularMovies_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getPopularMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
    
    func test_getTrendingMovies_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getTrendingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 1)
    }
    
    func test_getTrendingMovies_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getTrendingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
    
    func test_getTopRatedMovies_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getTopRatedMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 1)
    }
    
    func test_getTopRatedMovies_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getTopRatedMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
    
    func test_getUpcomingMovies_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = false
        
        // When
        sutInteractor.getUpcomingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 1)
    }
    
    func test_getUpcomingMovies_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetMovies)
        api.getMoviesShouldReturnError = true
        
        // When
        sutInteractor.getUpcomingMovies()
        
        // Then
        XCTAssertTrue(api.invokedGetMovies)
        XCTAssertEqual(api.invokedGetMoviesCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
    
    func test_getPopularTVShows_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getPopularTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowsItemsFromInteractorCount, 1)
    }
    
    func test_getPopularTVShows_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getPopularTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowsItemsFromInteractorCount, 0)
    }
    
    func test_getTrendingTVShows_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getTrendingTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowsItemsFromInteractorCount, 1)
    }
    
    func test_getTrendingTVShows_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getTrendingTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
    
    func test_getTopRatedTVShows_WhenSuccessfulOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = false
        
        // When
        sutInteractor.getTopRatedTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertTrue(presenter.invokedDidFetchTVShowsItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchTVShowsItemsFromInteractorCount, 1)
    }
    
    func test_getTopRatedTVShows_WhenFailureOperation_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertFalse(api.invokedGetTVShows)
        api.getTVShowsShouldReturnError = true
        
        // When
        sutInteractor.getTopRatedTVShows()
        
        // Then
        XCTAssertTrue(api.invokedGetTVShows)
        XCTAssertEqual(api.invokedGetTVShowsCount, 1)
        XCTAssertFalse(presenter.invokedDidFetchMoviesItemsFromInteractor)
        XCTAssertEqual(presenter.invokedDidFetchMoviesItemsFromInteractorCount, 0)
    }
}
