//
//  SearchInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import Foundation

protocol SearchInteractorProtocol {
    func getSearchedMovies(page: Int, key: String)
    func getSearchedTVShows(page: Int, key: String)
}

final class SearchInteractor: SearchInteractorProtocol {

    weak var presenter: SearchPresenterProtocol?

    private var api: MoviesTVShowsSearchedProtocol?

    init(apiProtocol: MoviesTVShowsSearchedProtocol) {
        self.api = apiProtocol
    }

    func getSearchedMovies(page: Int = 1, key: String) {
        api?.getSearchedMovies(target: MoviesTVShowsNetworking.getSearchMovies(page: page, key: key), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchSearchedMoviesItems(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }

    func getSearchedTVShows(page: Int = 1, key: String) {
        api?.getSearchedTVShows(target: MoviesTVShowsNetworking.getSearchTVShow(page: page, key: key), completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchSearchedTVShowsItems(model: success)
            case .failure(let failure):
                self.presenter?.showAlertView(message: failure.localizedDescription)
            }
        })
    }
}
