//
//  HomePresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 6.10.2023.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func getPopularItemsFromInteractor(page: Int?)
    func getTopRatedItemsFromInteractor(page: Int?)
    func getTrendingItemsFromInteractor(page: Int?)
    func getUpcomingItemsFromInteractor(page: Int?)
    func didFetchMovieItemsFromInteractor(model: ItemsResult<MoviesItem>, endpoint: HomeViewMoviesEndpoints)
    func didFetchTVShowItemsFromInteractor(model: ItemsResult<TVShowsItem>, endpoint: HomeViewTVShowsEndpoints)
    func pushToSeeAllViewControllerPopularItems()
    func pushToSeeAllViewControllerTopRatedItems()
    func pushToSeeAllViewControllerTrendingItems()
    func pushToSeeAllViewControllerUpcomingItems()
    func pushToDetailsViewController(id: String, itemType: ItemType)
    func showAlertView(message: String)

    var popularMovies: [MoviesItem]? { get }
    var topRatedMovies: [MoviesItem]? { get }
    var trendingMovies: [MoviesItem]? { get }
    var upcomingMovies: [MoviesItem]? { get }
    var popularTVShows: [TVShowsItem]? { get }
    var topRatedTVShows: [TVShowsItem]? { get }
    var trendingTVShows: [TVShowsItem]? { get }

    var popularMoviesPage: Int? { get }
    var topRatedMoviesPage: Int? { get }
    var trendingMoviesPage: Int? { get }
    var upcomingMoviesPage: Int? { get }
    var popularTVShowsPage: Int? { get }
    var topRatedTVShowsPage: Int? { get }
    var trendingTVShowsPage: Int? { get }

    var selectedRandomMovieTrendItem: MoviesItem? { get }
    var selectedRandomTVShowTrendItem: TVShowsItem? { get }

    var segmentedControllType: ItemType { get set }
}

final class HomePresenter: HomePresenterProtocol {

    private weak var viewController: HomeViewControllerProtocol?
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?

    var popularMovies: [MoviesItem]?
    var topRatedMovies: [MoviesItem]?
    var trendingMovies: [MoviesItem]?
    var upcomingMovies: [MoviesItem]?
    var popularTVShows: [TVShowsItem]?
    var topRatedTVShows: [TVShowsItem]?
    var trendingTVShows: [TVShowsItem]?

    var popularMoviesPage: Int?
    var topRatedMoviesPage: Int?
    var trendingMoviesPage: Int?
    var upcomingMoviesPage: Int?
    var popularTVShowsPage: Int?
    var topRatedTVShowsPage: Int?
    var trendingTVShowsPage: Int?

    var segmentedControllType: ItemType = .movie

    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol, view: HomeViewControllerProtocol) {
        self.interactor = interactor
        self.router = router
        self.viewController = view
    }

    var selectedRandomMovieTrendItem: MoviesItem? {
        return trendingMovies?.randomElement()
    }

    var selectedRandomTVShowTrendItem: TVShowsItem? {
        return trendingTVShows?.randomElement()
    }

    func getPopularItemsFromInteractor(page: Int?) {
        switch segmentedControllType {
        case .movie:
            interactor?.getPopularMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getPopularTVShows(page: page ?? 1)
        }
    }

    func getTopRatedItemsFromInteractor(page: Int?) {
        switch segmentedControllType {
        case .movie:
            interactor?.getTopRatedMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getTopRatedTVShows(page: page ?? 1)
        }
    }

    func getTrendingItemsFromInteractor(page: Int?) {
        switch segmentedControllType {
        case .movie:
            interactor?.getTrendingMovies(page: page ?? 1)
        case .tvShow:
            interactor?.getTrendingTVShows(page: page ?? 1)
        }
    }
    func getUpcomingItemsFromInteractor(page: Int?) {
        interactor?.getUpcomingMovies(page: page ?? 1)
    }

    func didFetchMovieItemsFromInteractor(model: ItemsResult<MoviesItem>, endpoint: HomeViewMoviesEndpoints) {
        switch endpoint {
        case.getPopularMovies:
            if self.popularMovies != nil {
                self.popularMovies?.append(contentsOf: model.results ?? [])
            } else {
                self.popularMovies = model.results
            }
            self.popularMoviesPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .popularItemsCollectionView)
        case.getTopRatedMovies:
            if self.topRatedMovies != nil {
                self.topRatedMovies?.append(contentsOf: model.results ?? [])
            } else {
                self.topRatedMovies = model.results
            }
            self.topRatedMoviesPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .topRatedItemsCollectionView)
        case.getTrendingMovies:
            if self.trendingMovies != nil {
                self.trendingMovies?.append(contentsOf: model.results ?? [])
            } else {
                self.trendingMovies = model.results
            }
            self.trendingMoviesPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .trendingItemsCollectionView)
        case.getUpcomingMovies:
            if self.upcomingMovies != nil {
                self.upcomingMovies?.append(contentsOf: model.results ?? [])
            } else {
                self.upcomingMovies = model.results
            }
            self.upcomingMoviesPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .upcomingMoviesCollectionView)
        }
    }

    func didFetchTVShowItemsFromInteractor(model: ItemsResult<TVShowsItem>, endpoint: HomeViewTVShowsEndpoints) {
        switch endpoint {
        case .getPopularTVShows:
            if self.popularTVShows != nil {
                self.popularTVShows?.append(contentsOf: model.results ?? [])
            } else {
                self.popularTVShows = model.results
            }
            self.popularTVShowsPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .popularItemsCollectionView)
        case .getTopRatedTVShows:
            if self.topRatedTVShows != nil {
                self.topRatedTVShows?.append(contentsOf: model.results ?? [])
            } else {
                self.topRatedTVShows = model.results
            }
            self.topRatedTVShowsPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .topRatedItemsCollectionView)
        case .getTrendingTVShows:
            if self.trendingTVShows != nil {
                self.trendingTVShows?.append(contentsOf: model.results ?? [])
            } else {
                self.trendingTVShows = model.results
            }
            self.trendingTVShowsPage = model.page
            self.viewController?.updateCollectionViews(collectionView: .trendingItemsCollectionView)
        }
    }

    func showAlertView(message: String) {
        self.viewController?.showAlert(message: message)
    }

    func pushToSeeAllViewControllerPopularItems() {
        switch segmentedControllType {
        case .movie:
            self.router?.pushToSeeAllItemsViewController(existItems: popularMovies ?? [], page: popularMoviesPage ?? 1, itemType: segmentedControllType, collectionView: .popularItemsCollectionView)
        case .tvShow:
            self.router?.pushToSeeAllItemsViewController(existItems: popularTVShows ?? [], page: popularTVShowsPage ?? 1, itemType: segmentedControllType, collectionView: .popularItemsCollectionView)
        }
    }

    func pushToSeeAllViewControllerTrendingItems() {
        switch segmentedControllType {
        case .movie:
            self.router?.pushToSeeAllItemsViewController(existItems: trendingMovies ?? [], page: trendingMoviesPage ?? 1, itemType: segmentedControllType, collectionView: .trendingItemsCollectionView)
        case .tvShow:
            self.router?.pushToSeeAllItemsViewController(existItems: trendingTVShows ?? [], page: trendingTVShowsPage ?? 1, itemType: segmentedControllType, collectionView: .trendingItemsCollectionView)
        }
    }

    func pushToSeeAllViewControllerTopRatedItems() {
        switch segmentedControllType {
        case .movie:
            self.router?.pushToSeeAllItemsViewController(existItems: topRatedMovies ?? [], page: topRatedMoviesPage ?? 1, itemType: segmentedControllType, collectionView: .topRatedItemsCollectionView)
        case .tvShow:
            self.router?.pushToSeeAllItemsViewController(existItems: topRatedTVShows ?? [], page: topRatedTVShowsPage ?? 1, itemType: segmentedControllType, collectionView: .topRatedItemsCollectionView)
        }
    }

    func pushToSeeAllViewControllerUpcomingItems() {
        self.router?.pushToSeeAllItemsViewController(existItems: upcomingMovies ?? [], page: upcomingMoviesPage ?? 1, itemType: segmentedControllType, collectionView: .upcomingMoviesCollectionView)
    }

    func pushToDetailsViewController(id: String, itemType: ItemType) {
        self.router?.pushToDetailsViewController(id: id, itemType: itemType)
    }
}
