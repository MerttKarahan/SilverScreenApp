//
//  MockHomePresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 27.12.2023.
//

@testable import SilverScreen

final class MockHomePresenter: HomePresenterProtocol {
    func showAlertView(message: String) {
        
    }
    
    
    var popularMovies: [SilverScreen.MoviesItem]?
    var topRatedMovies: [SilverScreen.MoviesItem]?
    var trendingMovies: [SilverScreen.MoviesItem]?
    var upcomingMovies: [SilverScreen.MoviesItem]?
    var popularTVShows: [SilverScreen.TVShowsItem]?
    var topRatedTVShows: [SilverScreen.TVShowsItem]?
    var trendingTVShows: [SilverScreen.TVShowsItem]?
    var popularMoviesPage: Int?
    var topRatedMoviesPage: Int?
    var trendingMoviesPage: Int?
    var upcomingMoviesPage: Int?
    var popularTVShowsPage: Int?
    var topRatedTVShowsPage: Int?
    var trendingTVShowsPage: Int?
    var selectedRandomMovieTrendItem: SilverScreen.MoviesItem?
    var selectedRandomTVShowTrendItem: SilverScreen.TVShowsItem?
    var segmentedControllType: SilverScreen.ItemType = .movie
    
    func getPopularItemsFromInteractor(page: Int?) {
        
    }
    
    func getTopRatedItemsFromInteractor(page: Int?) {
        
    }
    
    func getTrendingItemsFromInteractor(page: Int?) {
        
    }
    
    func getUpcomingItemsFromInteractor(page: Int?) {
        
    }
    
    var invokedDidFetchMovieItemsFromInteractor: Bool = false
    var invokedDidFetchMovieItemsFromInteractorCount: Int = 0
    func didFetchMovieItemsFromInteractor(model: SilverScreen.ItemsResult<SilverScreen.MoviesItem>, endpoint: SilverScreen.HomeViewMoviesEndpoints) {
        self.invokedDidFetchMovieItemsFromInteractor = true
        self.invokedDidFetchMovieItemsFromInteractorCount += 1
    }
    
    var invokedDidFetchTVShowItemsFromInteractor: Bool = false
    var invokedDidFetchTVShowItemsFromInteractorCount: Int = 0
    func didFetchTVShowItemsFromInteractor(model: SilverScreen.ItemsResult<SilverScreen.TVShowsItem>, endpoint: SilverScreen.HomeViewTVShowsEndpoints) {
        self.invokedDidFetchTVShowItemsFromInteractor = true
        self.invokedDidFetchTVShowItemsFromInteractorCount += 1
    }
    
    func pushToSeeAllViewControllerPopularItems() {
        
    }
    
    func pushToSeeAllViewControllerTopRatedItems() {
        
    }
    
    func pushToSeeAllViewControllerTrendingItems() {
        
    }
    
    func pushToSeeAllViewControllerUpcomingItems() {
        
    }
    
    func pushToDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        
    }
}
