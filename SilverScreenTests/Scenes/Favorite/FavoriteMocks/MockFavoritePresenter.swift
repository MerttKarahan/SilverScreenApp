//
//  MockFavoritePresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

@testable import SilverScreen

final class MockFavoritePresenter: FavoritesPresenterProtocol {

    var itemType: SilverScreen.ItemType?
    var numberOfItems: Int = 0
    var favoriteItems: [SilverScreen.FavoritesModel] = []
    var willDeletedItem: SilverScreen.FavoritesModel?
    
    func getCellModel(at index: Int) -> SilverScreen.FavoritesModel {
        return FavoritesModel(itemId: "1", title: "test", imageURL: "test")
    }
    
    func fetchFavoriteDatasFromInteractor() {
        
    }
    
    func pushToDetailViewController(id: String) {
        
    }
    
    var invokedDidFetchFavoriteDatasFromInteractor: Bool = false
    var invokedDidFetchFavoriteDatasFromInteractorCount: Int = 0
    func didFetchFavoriteDatasFromInteractor(favorites: [SilverScreen.FavoritesModel]) {
        self.invokedDidFetchFavoriteDatasFromInteractor = true
        self.invokedDidFetchFavoriteDatasFromInteractorCount += 1
    }
    
    var invokedDidDeleteFavoriteDatasFromInteractor: Bool = false
    var invokedDidDeleteFavoriteDatasFromInteractorCount: Int = 0
    func didDeleteFavoriteDatasFromInteractor(message: String) {
        self.invokedDidDeleteFavoriteDatasFromInteractor = true
        self.invokedDidDeleteFavoriteDatasFromInteractorCount += 1
    }
}
