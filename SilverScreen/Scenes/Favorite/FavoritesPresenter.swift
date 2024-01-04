//
//  FavoritesPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 1.12.2023.
//

import Foundation

protocol FavoritesPresenterProtocol: AnyObject {
    var itemType: ItemType? { get set }
    var numberOfItems: Int { get }
    var favoriteItems: [FavoritesModel] { get set }
    var willDeletedItem: FavoritesModel? { get set }

    func getCellModel(at index: Int) -> FavoritesModel
    func fetchFavoriteDatasFromInteractor()
    func didFetchFavoriteDatasFromInteractor(favorites: [FavoritesModel])
    func didDeleteFavoriteDatasFromInteractor(message: String)
    func pushToDetailViewController(id: String)
}

final class FavoritesPresenter: FavoritesPresenterProtocol {

    private weak var viewController: FavoritesViewControllerProtocol?
    private var interactor: FavoritesInteractorProtocol?
    private var router: FavoritesRouterProtocol?

    init(viewController: FavoritesViewControllerProtocol, interactor: FavoritesInteractorProtocol, router: FavoritesRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }

    var itemType: ItemType? = .movie {
        didSet {
            self.fetchFavoriteDatasFromInteractor()
        }
    }

    var favoriteItems: [FavoritesModel] = []

    var willDeletedItem: FavoritesModel? {
        didSet {
            self.deleteFavoriteDatasFromInteractor()
        }
    }

    var numberOfItems: Int {
        self.favoriteItems.count
    }

    func getCellModel(at index: Int) -> FavoritesModel {
        self.favoriteItems[index]
    }

    func fetchFavoriteDatasFromInteractor() {
        guard let itemType = itemType else { return }
        self.interactor?.fetchFavoriteDatasFromFirebase(itemType: itemType)
    }

    func deleteFavoriteDatasFromInteractor() {
        guard let id = self.willDeletedItem?.itemId, let itemType = self.itemType else { return }
        self.interactor?.deleteFavoriteDatasFromFirebase(itemId: id, itemType: itemType)
    }

    func didDeleteFavoriteDatasFromInteractor(message: String) {
        self.viewController?.didDeletedItem(message: message)
    }

    func didFetchFavoriteDatasFromInteractor(favorites: [FavoritesModel]) {
        self.favoriteItems = favorites
        self.viewController?.reloadTableView()
    }

    func pushToDetailViewController(id: String) {
        guard let itemType = itemType else { return }
        self.router?.pushToDetailViewController(id: id, itemType: itemType)
    }
}
