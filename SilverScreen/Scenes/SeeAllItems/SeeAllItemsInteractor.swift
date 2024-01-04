//
//  SeeAllItemsInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 9.11.2023.
//

import Foundation

protocol SeeAllItemsInteractorProtocol {
    func getPopularMovies(page: Int)
    func getTrendingMovies(page: Int)
    func getTopRatedMovies(page: Int)
    func getUpcomingMovies(page: Int)
    func getPopularTVShows(page: Int)
    func getTrendingTVShows(page: Int)
    func getTopRatedTVShows(page: Int)
}

final class SeeAllItemsInteractor: SeeAllItemsInteractorProtocol {

    weak var presenter: SeeAllItemsPresenterProtocol?

    private var api: MoviesTVShowsAPIProtocol?

    init(apiProtocol: MoviesTVShowsAPIProtocol?) {
        self.api = apiProtocol
    }

    func getPopularMovies(page: Int = 1) {
        api?.getMovies(target: MoviesTVShowsNetworking.getPopularMovies(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchMoviesItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getTrendingMovies(page: Int = 1) {
        api?.getMovies(target: MoviesTVShowsNetworking.getTrendingMovies(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchMoviesItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getTopRatedMovies(page: Int = 1) {
        api?.getMovies(target: MoviesTVShowsNetworking.getTopRatedMovies(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchMoviesItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getUpcomingMovies(page: Int = 1) {
        api?.getMovies(target: MoviesTVShowsNetworking.getUpcomingMovies(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchMoviesItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getPopularTVShows(page: Int = 1) {
        api?.getTVShows(target: MoviesTVShowsNetworking.getPopularTVShows(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchTVShowsItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getTrendingTVShows(page: Int = 1) {
        api?.getTVShows(target: MoviesTVShowsNetworking.getTrendingTVShows(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchTVShowsItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getTopRatedTVShows(page: Int = 1) {
        api?.getTVShows(target: MoviesTVShowsNetworking.getTopRatedTVShows(page: page), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchTVShowsItemsFromInteractor(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }
}
