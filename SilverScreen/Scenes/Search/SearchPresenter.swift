//
//  SearchPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    var itemType: ItemType { get set }
    var searchedMovies: [MoviesItem]? { get }
    var searchedTVShows: [TVShowsItem]? { get }
    var numberOfItems: Int { get }
    var moviesPage: Int { get set }
    var tvShowsPage: Int { get set }
    var key: String? { get set }

    func didFetchSearchedMoviesItems(model: ItemsResult<MoviesItem>)
    func didFetchSearchedTVShowsItems(model: ItemsResult<TVShowsItem>)
    func pushToDetailsViewController(id: String, itemType: ItemType)
    func showAlertView(message: String)
}

final class SearchPresenter: SearchPresenterProtocol {

    weak var viewController: SearchViewControllerProtocol?
    private var interactor: SearchInteractorProtocol?
    private var router: SearchRouterProtocol?

    var itemType: ItemType = .movie
    var searchedMovies: [MoviesItem]?
    var searchedTVShows: [TVShowsItem]?
    var moviesPage: Int = 1
    var tvShowsPage: Int = 1
    var key: String? {
        didSet {
//            guard let itemType = self.itemType else { return }
            switch itemType {
            case.movie:
                self.getSearchedItemsFromInteractor(page: moviesPage, key: key)
            case.tvShow:
                self.getSearchedItemsFromInteractor(page: tvShowsPage, key: key)
            }
        }
    }

    init(viewController: SearchViewControllerProtocol, interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.viewController = viewController
    }

    var numberOfItems: Int {
//        guard let itemType = self.itemType else { return .zero}
        switch itemType {
        case.movie:
            return searchedMovies?.count ?? .zero
        case.tvShow:
            return searchedTVShows?.count ?? .zero
        }
    }

    private func getSearchedItemsFromInteractor(page: Int, key: String?) {
//        guard let itemType = itemType else { return }
        switch itemType {
        case .movie:
            self.interactor?.getSearchedMovies(page: page, key: key ?? "")
        case .tvShow:
            self.interactor?.getSearchedTVShows(page: page, key: key ?? "")
        }
    }

    func didFetchSearchedMoviesItems(model: ItemsResult<MoviesItem>) {
        if model.results?.isEmpty == true {
            self.searchedMovies = []
            self.moviesPage = 1
        } else if self.searchedMovies != nil {
            self.searchedMovies?.append(contentsOf: model.results ?? [])
            self.moviesPage = model.page ?? .zero
        } else {
            self.searchedMovies = model.results
            self.moviesPage = model.page ?? .zero
        }
        self.viewController?.updateCollectionView()
    }

    func didFetchSearchedTVShowsItems(model: ItemsResult<TVShowsItem>) {
        if model.results?.isEmpty == true {
            self.searchedTVShows = []
            self.tvShowsPage = 1
        } else if self.searchedTVShows != nil {
            self.searchedTVShows?.append(contentsOf: model.results ?? [])
            self.tvShowsPage = model.page ?? .zero
        } else {
            self.searchedTVShows = model.results
            self.tvShowsPage = model.page ?? .zero
        }
        self.viewController?.updateCollectionView()
    }

    func showAlertView(message: String) {
        self.viewController?.showAlert(message: message)
    }

    func pushToDetailsViewController(id: String, itemType: ItemType) {
        self.router?.pushToDetailsViewController(id: id, itemType: itemType)
    }
}
