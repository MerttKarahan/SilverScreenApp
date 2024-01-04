//
//  DetailsInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 12.11.2023.
//

import Foundation

protocol DetailsInteractorProtocol {
    func getMovieDetails(id: String)
    func getTVShowDetils(id: String)
    func getImages(id: String, itemType: ItemType)
    func getVideos(id: String, itemType: ItemType)
    func getSimilarItems(page: Int, id: String, itemType: ItemType)
    func getReviewItems(id: String, itemType: ItemType)
    func saveDataToFirebaseFromInteractor(favoriteModel: FavoritesModel, itemType: ItemType)
    func deleteDataFromFirebaseFromInteractor(itemId: String, itemType: ItemType)
    func checkDatasFromFirebase(id: String, itemType: ItemType)
}

final class DetailsInteractor: DetailsInteractorProtocol {
    weak var presenter: DetailsPresenterProtocol?

    private var api: MoviesTVShowsDetailsProtocol?
    private var firebaseReadingWritingHelper: FirebaseHelperReadingWritingProtocol?

    init(apiProtocol: MoviesTVShowsDetailsProtocol?, firebaseProtocol: FirebaseHelperReadingWritingProtocol?) {
        self.api = apiProtocol
        self.firebaseReadingWritingHelper = firebaseProtocol
    }

    func getMovieDetails(id: String) {
        api?.getMovieDetails(id: id) { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchMovieData(model: success)
            case .failure(let failure):
                self.presenter?.showAlert(message: failure.localizedDescription)
            }
        }
    }

    func getTVShowDetils(id: String) {
        api?.getTvShowDetails(id: id) { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchTVShowData(model: success)
            case .failure(let failure):
                self.presenter?.showAlert(message: failure.localizedDescription)
            }
        }
    }

    func getImages(id: String, itemType: ItemType) {
        switch itemType {
        case .movie:
            api?.getImages(target: MoviesTVShowsNetworking.getMovieImages(id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchImages(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
            }
        case .tvShow:
            api?.getImages(target: MoviesTVShowsNetworking.getTVShowImages(id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchImages(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
            }
        }
    }

    func getVideos(id: String, itemType: ItemType) {
        switch itemType {
        case .movie:
            api?.getVideos(target: MoviesTVShowsNetworking.getMovieVideos(id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchVideos(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
                }
        case .tvShow:
            api?.getVideos(target: MoviesTVShowsNetworking.getTVShowVideos(id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchVideos(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
                }
        }
    }

    func getSimilarItems(page: Int, id: String, itemType: ItemType) {
        switch itemType {
        case .movie:
            api?.getSimilarMovies(target: MoviesTVShowsNetworking.getSimilarMovies(page: page, id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchSimilarMovies(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
                }
        case .tvShow:
            api?.getSimilarTVShows(target: MoviesTVShowsNetworking.getSimilarTVShows(page: page, id: id)) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchSimilarTVShows(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
            }
        }
    }

    func getReviewItems(id: String, itemType: ItemType) {
        switch itemType {
        case .movie:
            api?.getMovieReviewers(id: id, page: 1) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchReviews(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
            }
        case .tvShow:
            api?.getTvShowReviewers(id: id, page: 1) { result in
                switch result {
                case .success(let success):
                    self.presenter?.didFetchReviews(model: success)
                case .failure(let failure):
                    self.presenter?.showAlert(message: failure.localizedDescription)
                }
            }
        }
    }

    func checkDatasFromFirebase(id: String, itemType: ItemType) {
        self.firebaseReadingWritingHelper?.fetchDataFromFirebase(itemType: itemType) {
            switch itemType {
            case .movie:
                guard let isExist = self.firebaseReadingWritingHelper?.movieItems?.contains(where: {$0.itemId == id }) else { return }
                self.presenter?.didFinishedOperationsInInteractor(message: nil, isItemExist: isExist)
            case .tvShow:
                guard let isExist = self.firebaseReadingWritingHelper?.tvShowItems?.contains(where: {$0.itemId == id }) else { return }
                self.presenter?.didFinishedOperationsInInteractor(message: nil, isItemExist: isExist)
            }
        }
    }

    func saveDataToFirebaseFromInteractor(favoriteModel: FavoritesModel, itemType: ItemType) {
        self.firebaseReadingWritingHelper?.saveDataToFireStore(favoriteModel: favoriteModel, itemType: itemType) { result in
            switch  result {
            case .success(let success):
                self.presenter?.didFinishedOperationsInInteractor(message: success, isItemExist: true)
            case .failure(let failure):
                self.presenter?.didFinishedOperationsInInteractor(message: failure.localizedDescription, isItemExist: false)
            }
        }
    }

    func deleteDataFromFirebaseFromInteractor(itemId: String, itemType: ItemType) {
        self.firebaseReadingWritingHelper?.deleteDataFromFirebase(itemId: itemId, itemType: itemType) { result in
            switch result {
            case .success(let success):
                self.presenter?.didFinishedOperationsInInteractor(message: success, isItemExist: false)
            case .failure(let failure):
                self.presenter?.didFinishedOperationsInInteractor(message: failure.localizedDescription, isItemExist: true)
            }
        }
    }
}
