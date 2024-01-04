//
//  MockSeeAllItemsInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen

final class MockSeeAllItemsInteractor: SeeAllItemsInteractorProtocol {
    
    var invokedGetPopularMovies: Bool = false
    var invokedGetPopularMoviesCount: Int = 0
    func getPopularMovies(page: Int) {
        self.invokedGetPopularMovies = true
        self.invokedGetPopularMoviesCount += 1
    }
    
    var invokedGetTrendingMovies: Bool = false
    var invokedGetTrendingMoviesCount: Int = 0
    func getTrendingMovies(page: Int) {
        self.invokedGetTrendingMovies = true
        self.invokedGetTrendingMoviesCount += 1
    }
    
    var invokedGetTopRatedMovies: Bool = false
    var invokedGetTopRatedMoviesCount: Int = 0
    func getTopRatedMovies(page: Int) {
        self.invokedGetTopRatedMovies = true
        self.invokedGetTopRatedMoviesCount += 1
    }
    
    var invokedGetUpcomingMovies: Bool = false
    var invokedGetUpcomingMoviesCount: Int = 0
    func getUpcomingMovies(page: Int) {
        self.invokedGetUpcomingMovies = true
        self.invokedGetUpcomingMoviesCount += 1
    }
    
    var invokedGetPopularTVShows: Bool = false
    var invokedGetPopularTVShowsCount: Int = 0
    func getPopularTVShows(page: Int) {
        self.invokedGetPopularTVShows = true
        self.invokedGetPopularTVShowsCount += 1
    }
    
    var invokedGetTrendingTVShows: Bool = false
    var invokedGetTrendingTVShowsCount: Int = 0
    func getTrendingTVShows(page: Int) {
        self.invokedGetTrendingTVShows = true
        self.invokedGetTrendingTVShowsCount += 1
    }
    
    var invokedGetTopRatedTVShows: Bool = false
    var invokedGetTopRatedTVShowsCount: Int = 0
    func getTopRatedTVShows(page: Int) {
        self.invokedGetTopRatedTVShows = true
        self.invokedGetTopRatedTVShowsCount += 1
    }
}
