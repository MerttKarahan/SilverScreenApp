//
//  MockFavoriteInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

@testable import SilverScreen

final class MockFavoriteInteractor: FavoritesInteractorProtocol {
    
    var invokedFetchFavoriteDatasFromFirebase: Bool = false
    var invokedFetchFavoriteDatasFromFirebaseCount: Int = 0
    func fetchFavoriteDatasFromFirebase(itemType: SilverScreen.ItemType) {
        self.invokedFetchFavoriteDatasFromFirebase = true
        self.invokedFetchFavoriteDatasFromFirebaseCount += 1
    }
    
    var invokedDeleteFavoriteDatasFromFirebase: Bool = false
    var invokedDeleteFavoriteDatasFromFirebaseCount: Int = 0
    func deleteFavoriteDatasFromFirebase(itemId: String, itemType: SilverScreen.ItemType) {
        self.invokedDeleteFavoriteDatasFromFirebase = true
        self.invokedDeleteFavoriteDatasFromFirebaseCount += 1
    }
}
