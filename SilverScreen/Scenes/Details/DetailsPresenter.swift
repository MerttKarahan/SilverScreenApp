//
//  DetailsPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 12.11.2023.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    func saveDataToFireBase()
    func getDataFromInteractor()
    func getSimilarItemFromInteractor(page: Int?)
    func getReviewItemsFromInteractor()
    func refreshVideo()
    func didFetchMovieData(model: MoviesDetailResult)
    func didFetchTVShowData(model: TVShowsDetailResult)
    func didFetchImages(model: ImagesResult)
    func didFetchVideos(model: VideosModel)
    func didFetchSimilarMovies(model: ItemsResult<MoviesItem>)
    func didFetchSimilarTVShows(model: ItemsResult<TVShowsItem>)
    func didFetchReviews(model: ReviewersResult)
    func pushToOtherDetailsViewController(id: String, itemType: ItemType)
    func deleteDataFromFirebase()
    func checkFirebaseDatasFromInteractor()
    func didFinishedOperationsInInteractor(message: String?, isItemExist: Bool)
    func showAlert(message: String)

    func goBackHomeViewController()

    var movieItem: MoviesDetailResult? { get }
    var tvShowItem: TVShowsDetailResult? { get }
    var similarMovies: [MoviesItem]? { get }
    var similarTVShows: [TVShowsItem]? { get }
    var reviews: [ReviewItem]? { get }
    var itemType: ItemType? { get }
    var id: String? { get }
    var similarTVShowsPage: Int? { get }
    var similarMoviesPage: Int? { get }
}

final class DetailsPresenter: DetailsPresenterProtocol {
    private weak var viewController: DetailsViewControllerProtocol?
    private var interactor: DetailsInteractorProtocol?
    private var router: DetailsRouterProtocol?

    private var firebaseHelper: FirebaseHelperReadingWritingProtocol = FirebaseHelper()

    var id: String?
    var itemType: ItemType?

    var images: ImagesResult?
    var videos: VideosModel?
    var movieItem: MoviesDetailResult?
    var tvShowItem: TVShowsDetailResult?
    var similarMovies: [MoviesItem]?
    var similarTVShows: [TVShowsItem]?
    var reviews: [ReviewItem]?

    var similarTVShowsPage: Int?
    var similarMoviesPage: Int?

    init(viewController: DetailsViewControllerProtocol, interactor: DetailsInteractorProtocol, router: DetailsRouterProtocol, id: String?, itemType: ItemType?) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router

        self.id = id
        self.itemType = itemType
    }

    func getDataFromInteractor() {
        guard let itemType = self.itemType, let id = self.id else { return }
        switch itemType {
        case .movie:
            interactor?.getMovieDetails(id: id)
        case .tvShow:
            interactor?.getTVShowDetils(id: id)
        }
        interactor?.getImages(id: id, itemType: itemType)
        interactor?.getVideos(id: id, itemType: itemType)
    }

    func getSimilarItemFromInteractor(page: Int?) {
        guard let itemType = self.itemType, let id = self.id else { return }
        interactor?.getSimilarItems(page: page ?? 1, id: id, itemType: itemType)
    }

    func getReviewItemsFromInteractor() {
        guard let itemType = self.itemType, let id = self.id else { return }
        interactor?.getReviewItems(id: id, itemType: itemType)
    }

    func refreshVideo() {
        if let randomId = videos?.results?.randomElement()?.key {
            self.viewController?.setupVideoPlayer(with: randomId)
        }
    }

    func checkFirebaseDatasFromInteractor() {
        guard let itemType = self.itemType, let id = self.id else { return }
        self.interactor?.checkDatasFromFirebase(id: id, itemType: itemType)
    }

    func saveDataToFireBase() {
        guard let itemType = self.itemType, let id = self.id else { return }

        var title: String?
        var imageURL: String?

        switch itemType {
        case.movie:
            title = self.movieItem?.title
            imageURL = self.movieItem?.poster_path
        case.tvShow:
            title = self.tvShowItem?.name
            imageURL = self.tvShowItem?.poster_path
        }
        guard let title = title, let imageURL = imageURL else { return }
        let favoriteModel = FavoritesModel(itemId: id, title: title, imageURL: imageURL)
        self.interactor?.saveDataToFirebaseFromInteractor(favoriteModel: favoriteModel, itemType: itemType)
    }

    func deleteDataFromFirebase() {
        guard let itemType = self.itemType, let id = self.id else { return }
        self.interactor?.deleteDataFromFirebaseFromInteractor(itemId: id, itemType: itemType)
    }

    func didFinishedOperationsInInteractor(message: String?, isItemExist: Bool) {
        self.viewController?.didFinishedFirebaseOperation(message: message, isItemExist: isItemExist)
    }

    func didFetchMovieData(model: MoviesDetailResult) {
        guard let itemType = self.itemType else { return }
        self.movieItem = model
        self.viewController?.setupInfoAndOverviewView(model: self.movieItem, itemType: itemType)
    }

    func didFetchTVShowData(model: TVShowsDetailResult) {
        guard let itemType = self.itemType else { return }
        self.tvShowItem = model
        self.viewController?.setupInfoAndOverviewView(model: self.tvShowItem, itemType: itemType)
    }

    func didFetchImages(model: ImagesResult) {
        self.images = model
    }

    func didFetchVideos(model: VideosModel) {
        self.videos = model
        if let videoId = self.videos?.results?.first?.key {
            self.viewController?.setupVideoPlayer(with: videoId)
        } else {
            self.viewController?.setupVideoPlayer(with: "")
        }
    }

    func didFetchSimilarMovies(model: ItemsResult<MoviesItem>) {
        if self.similarMovies != nil {
            self.similarMovies?.append(contentsOf: model.results ?? [])
        } else {
            self.similarMovies = model.results
        }
        self.similarMoviesPage = model.page
        self.viewController?.setupSimilarsView(model: self.similarMovies)
    }

    func didFetchSimilarTVShows(model: ItemsResult<TVShowsItem>) {
        if self.similarTVShows != nil {
            self.similarTVShows?.append(contentsOf: model.results ?? [])
        } else {
            self.similarTVShows = model.results
        }
        self.similarTVShowsPage = model.page
        self.viewController?.setupSimilarsView(model: self.similarTVShows)
    }

    func didFetchReviews(model: ReviewersResult) {
        self.reviews = model.results
        self.viewController?.setupReviewView(model: self.reviews ?? [])
    }

    func showAlert(message: String) {
        self.viewController?.showAlert(message: message)
    }

    func goBackHomeViewController() {
        self.router?.goBack()
    }

    func pushToOtherDetailsViewController(id: String, itemType: ItemType) {
        self.router?.pushOtherDetailsViewController(id: id, itemType: itemType)
    }
}
