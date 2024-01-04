//
//  MockSearchPresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen

final class MockSearchPresenter: SearchPresenterProtocol {
    func showAlertView(message: String) {
        
    }
    
    
    var itemType: SilverScreen.ItemType = .movie
    
    var searchedMovies: [SilverScreen.MoviesItem]?
    
    var searchedTVShows: [SilverScreen.TVShowsItem]?
    
    var numberOfItems: Int = 0
    
    var moviesPage: Int = 0
    
    var tvShowsPage: Int = 0
    
    var key: String?
    
    var invokedDidFetchSearchedMoviesItems: Bool = false
    var invokedDidFetchSearchedMoviesItemsCount: Int = 0
    func didFetchSearchedMoviesItems(model: SilverScreen.ItemsResult<SilverScreen.MoviesItem>) {
        self.invokedDidFetchSearchedMoviesItems = true
        self.invokedDidFetchSearchedMoviesItemsCount += 1
    }
    
    var invokedDidFetchSearchedTVShowsItems: Bool = false
    var invokedDidFetchSearchedTVShowsItemsCount: Int = 0
    func didFetchSearchedTVShowsItems(model: SilverScreen.ItemsResult<SilverScreen.TVShowsItem>) {
        self.invokedDidFetchSearchedTVShowsItems = true
        self.invokedDidFetchSearchedTVShowsItemsCount += 1
    }
    
    func pushToDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        
    }
}
