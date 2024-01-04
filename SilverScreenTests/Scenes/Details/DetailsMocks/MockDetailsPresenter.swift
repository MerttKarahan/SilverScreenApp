//
//  MockDetailsPresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen

final class MockDetailsPresenter: DetailsPresenterProtocol {
    func showAlert(message: String) {
        
    }
    

    var movieItem: SilverScreen.MoviesDetailResult? = nil
    var tvShowItem: SilverScreen.TVShowsDetailResult? = nil
    var similarMovies: [SilverScreen.MoviesItem]? = nil
    var similarTVShows: [SilverScreen.TVShowsItem]? = nil
    var reviews: [SilverScreen.ReviewItem]? = nil
    var itemType: SilverScreen.ItemType? = nil
    var id: String? = ""
    var similarTVShowsPage: Int? = 1
    var similarMoviesPage: Int? = 1
    
    func saveDataToFireBase() {
        
    }
    
    func getDataFromInteractor() {
        
    }
    
    func getSimilarItemFromInteractor(page: Int?) {
        
    }
    
    func getReviewItemsFromInteractor() {
        
    }
    
    func refreshVideo() {
        
    }
    
    var invokedDidFetchMovieData: Bool = false
    var invokedDidFetchMovieDataCount: Int = 0
    func didFetchMovieData(model: SilverScreen.MoviesDetailResult) {
        self.invokedDidFetchMovieData = true
        self.invokedDidFetchMovieDataCount += 1
    }
    
    var invokedDidFetchTVShowData: Bool = false
    var invokedDidFetchTVShowDataCount: Int = 0
    func didFetchTVShowData(model: SilverScreen.TVShowsDetailResult) {
        self.invokedDidFetchTVShowData = true
        self.invokedDidFetchTVShowDataCount += 1
    }
    
    var invokedDidFetchImages: Bool = false
    var invokedDidFetchImagesCount: Int = 0
    func didFetchImages(model: SilverScreen.ImagesResult) {
        self.invokedDidFetchImages = true
        self.invokedDidFetchImagesCount += 1
    }
    
    var invokedDidFetchVideos: Bool = false
    var invokedDidFetchVideosCount: Int = 0
    func didFetchVideos(model: SilverScreen.VideosModel) {
        self.invokedDidFetchVideos = true
        self.invokedDidFetchVideosCount += 1
    }
    
    var invokedDidFetchSimilarMovies: Bool = false
    var invokedDidFetchSimilarMoviesCount: Int = 0
    func didFetchSimilarMovies(model: SilverScreen.ItemsResult<SilverScreen.MoviesItem>) {
        self.invokedDidFetchSimilarMovies = true
        self.invokedDidFetchSimilarMoviesCount += 1
    }
    
    var invokedDidFetchSimilarTVShow: Bool = false
    var invokedDidFetchSimilarTVShowCount: Int = 0
    func didFetchSimilarTVShows(model: SilverScreen.ItemsResult<SilverScreen.TVShowsItem>) {
        self.invokedDidFetchSimilarTVShow = true
        self.invokedDidFetchSimilarTVShowCount += 1
    }
    
    var invokedDidFetchReviews: Bool = false
    var invokedDidFetchReviewsCount: Int = 0
    func didFetchReviews(model: SilverScreen.ReviewersResult) {
        self.invokedDidFetchReviews = true
        self.invokedDidFetchReviewsCount += 1
    }
    
    func pushToOtherDetailsViewController(id: String, itemType: SilverScreen.ItemType) {
        
    }
    
    func deleteDataFromFirebase() {
        
    }
    
    func checkFirebaseDatasFromInteractor() {
        
    }
    
    var invokedDidFinishedOperationsInInteractor: Bool = false
    var invokedDidFinishedOperationsInInteractorCount: Int = 0
    func didFinishedOperationsInInteractor(message: String?, isItemExist: Bool) {
        self.invokedDidFinishedOperationsInInteractor = true
        self.invokedDidFinishedOperationsInInteractorCount += 1
    }
    
    func goBackHomeViewController() {
        
    }
}
