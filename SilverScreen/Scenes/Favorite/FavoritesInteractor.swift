//
//  FavoritesInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 1.12.2023.
//

import Foundation

protocol FavoritesInteractorProtocol {
    func fetchFavoriteDatasFromFirebase(itemType: ItemType)
    func deleteFavoriteDatasFromFirebase(itemId: String, itemType: ItemType)
}

final class FavoritesInteractor: FavoritesInteractorProtocol {

    weak var presenter: FavoritesPresenterProtocol?
    private var firebaseHelperReadingWritingHelper: FirebaseHelperReadingWritingProtocol?

    init(firebaseHelperReadingWritingProtocol: FirebaseHelperReadingWritingProtocol) {
        self.firebaseHelperReadingWritingHelper = firebaseHelperReadingWritingProtocol
    }

    func fetchFavoriteDatasFromFirebase(itemType: ItemType) {
        self.firebaseHelperReadingWritingHelper?.fetchDataFromFirebase(itemType: itemType) {
            switch itemType {
            case .movie:
                guard let movieItems = self.firebaseHelperReadingWritingHelper?.movieItems else { return }
                self.presenter?.didFetchFavoriteDatasFromInteractor(favorites: movieItems)
            case .tvShow:
                guard let tvShowItems = self.firebaseHelperReadingWritingHelper?.tvShowItems else { return }
                self.presenter?.didFetchFavoriteDatasFromInteractor(favorites: tvShowItems)
            }
        }
    }

    func deleteFavoriteDatasFromFirebase(itemId: String, itemType: ItemType) {
        self.firebaseHelperReadingWritingHelper?.deleteDataFromFirebase(itemId: itemId, itemType: itemType) { result in
            switch result {
            case .success(let success):
                self.presenter?.didDeleteFavoriteDatasFromInteractor(message: success)
            case .failure(let failure):
                self.presenter?.didDeleteFavoriteDatasFromInteractor(message: failure.localizedDescription)
            }
        }
    }
}
