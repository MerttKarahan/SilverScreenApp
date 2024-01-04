//
//  SeeAllItemsPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 9.11.2023.
//

import Foundation

protocol SeeAllItemsPresenterProtocol: AnyObject {
    var itemType: ItemType? { get }
    var existItems: [Decodable] { get }
    var page: Int? { get }

    func getPopularItemsFromInteractor(page: Int?)
    func getTopRatedItemsFromInteractor(page: Int?)
    func getTrendingItemsFromInteractor(page: Int?)
    func getUpcomingItemsFromInteractor(page: Int?)

    func setupNavigationBarTitle() -> String
    func goBackHomeViewController()
    func pushToDetailsViewController(id: String, itemType: ItemType)

    func showAlertView(message: String)

    func didFetchTVShowsItemsFromInteractor(model: ItemsResult<TVShowsItem>)
    func didFetchMoviesItemsFromInteractor(model: ItemsResult<MoviesItem>)
}

final class SeeAllItemsPresenter: SeeAllItemsPresenterProtocol {

    private weak var viewController: SeeAllItemsViewControllerProtocol?
    private var interactor: SeeAllItemsInteractorProtocol?
    private var router: SeeAllItemsRouterProtocol?

    var existItems: [Decodable]
    var page: Int?
    var itemType: ItemType?
    var collectionView: HomeViewCollectionViews?

    init(viewController: SeeAllItemsViewControllerProtocol, interactor: SeeAllItemsInteractorProtocol, router: SeeAllItemsRouterProtocol, existItems: [Decodable], page: Int?, itemType: ItemType?, collectionView: HomeViewCollectionViews?) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router

        self.existItems = existItems
        self.page = page
        self.collectionView = collectionView
        self.itemType = itemType
    }

    func getPopularItemsFromInteractor(page: Int?) {
        guard let itemType = itemType else { return }
        switch itemType {
        case .movie:
            interactor?.getPopularMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getPopularTVShows(page: page ?? 1)
        }
    }

    func getTopRatedItemsFromInteractor(page: Int?) {
        guard let itemType = itemType else { return }
        switch itemType {
        case .movie:
            interactor?.getTopRatedMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getTopRatedTVShows(page: page ?? 1)
        }
    }

    func getTrendingItemsFromInteractor(page: Int?) {
        guard let itemType = itemType else { return }
        switch itemType {
        case .movie:
            interactor?.getTrendingMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getTrendingTVShows(page: page ?? 1)
        }
    }

    func getUpcomingItemsFromInteractor(page: Int?) {
        interactor?.getUpcomingMovies(page: page ?? 1)
    }

    func setupNavigationBarTitle() -> String {
        guard let itemType = self.itemType, let collectionView = self.collectionView else { return ""}
        return collectionView.collectionViewsTitle(itemType: itemType)
    }

    func didFetchTVShowsItemsFromInteractor(model: ItemsResult<TVShowsItem>) {
        self.existItems.append(contentsOf: model.results ?? [])
        self.page = model.page
        viewController?.updateCollectionView(itemType: .tvShow)
    }

    func didFetchMoviesItemsFromInteractor(model: ItemsResult<MoviesItem>) {
        self.existItems.append(contentsOf: model.results ?? [])
        self.page = model.page
        viewController?.updateCollectionView(itemType: .movie)
    }

    func goBackHomeViewController() {
        router?.goBack()
    }

    func showAlertView(message: String) {
        self.viewController?.showAlert(message: message)
    }

    func pushToDetailsViewController(id: String, itemType: ItemType) {
        router?.pushDetailsViewController(id: id, itemType: itemType)
    }
}
