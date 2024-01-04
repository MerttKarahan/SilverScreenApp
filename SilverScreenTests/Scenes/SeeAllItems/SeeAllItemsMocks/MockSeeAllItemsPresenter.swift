//
//  MockSeeAllItemsPresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen

final class MockSeeAllItemsPresenter: SeeAllItemsPresenterProtocol {

    func showAlertView(message: String) {
        
    }
    
    var itemType: SilverScreen.ItemType?
    
    var existItems: [Decodable] = []
    
    var page: Int?
    
    func getPopularItemsFromInteractor(page: Int?) {
        
    }
    
    func getTopRatedItemsFromInteractor(page: Int?) {
        
    }
    
    func getTrendingItemsFromInteractor(page: Int?) {
        
    }
    
    func getUpcomingItemsFromInteractor(page: Int?) {
        
    }
    
    func setupNavigationBarTitle() -> String {
        return ""
    }
    
    func goBackHomeViewController() {
        
    }
    
    func pushToDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        
    }
    
    var invokedDidFetchTVShowsItemsFromInteractor: Bool = false
    var invokedDidFetchTVShowsItemsFromInteractorCount: Int = 0
    func didFetchTVShowsItemsFromInteractor(model: SilverScreen.ItemsResult<SilverScreen.TVShowsItem>) {
        self.invokedDidFetchTVShowsItemsFromInteractor = true
        self.invokedDidFetchTVShowsItemsFromInteractorCount += 1
    }
    
    var invokedDidFetchMoviesItemsFromInteractor: Bool = false
    var invokedDidFetchMoviesItemsFromInteractorCount: Int = 0
    func didFetchMoviesItemsFromInteractor(model: SilverScreen.ItemsResult<SilverScreen.MoviesItem>) {
        self.invokedDidFetchMoviesItemsFromInteractor = true
        self.invokedDidFetchMoviesItemsFromInteractorCount += 1
    }
}
