//
//  DetailsInteractorTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen
import XCTest

final class DetailsInteractorTests: XCTestCase {
    
    private var sutInteractor: DetailsInteractor!
    private var presenter: MockDetailsPresenter!
    private var api: MockMoviesTVShowsDetailsAPI!
    private var firebaseHelperReadingWritingHelper: MockFirebaseHelperReadingWritingHelper!
    
    override func setUp() {
        super.setUp()
        self.presenter = .init()
        self.api = .init()
        self.firebaseHelperReadingWritingHelper = .init()
        self.sutInteractor = .init(apiProtocol: api, firebaseProtocol: firebaseHelperReadingWritingHelper)
        sutInteractor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        self.presenter = nil
        self.api = nil
        self.firebaseHelperReadingWritingHelper = nil
        self.sutInteractor = nil
    }
    
    func test_getMovieDetails_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMovieData)
        XCTAssertFalse(api.invokedGetMovieDetails)
        api.getMovieDetailsShouldReturnError = false
        
        // When
        sutInteractor.getMovieDetails(id: "test")
        
        // Then
        XCTAssertTrue(presenter.invokedDidFetchMovieData)
        XCTAssertEqual(presenter.invokedDidFetchMovieDataCount, 1)
        XCTAssertTrue(api.invokedGetMovieDetails)
        XCTAssertEqual(api.invokedGetMovieDetailsCount, 1)
    }
    
    func test_getMovieDetails_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchMovieData)
        XCTAssertFalse(api.invokedGetMovieDetails)
        api.getMovieDetailsShouldReturnError = true
        
        // When
        sutInteractor.getMovieDetails(id: "test")
        
        // Then
        XCTAssertFalse(presenter.invokedDidFetchMovieData)
        XCTAssertEqual(presenter.invokedDidFetchMovieDataCount, 0)
        XCTAssertTrue(api.invokedGetMovieDetails)
        XCTAssertEqual(api.invokedGetMovieDetailsCount, 1)
    }
    
    func test_getTVShowDetils_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowData)
        XCTAssertFalse(api.invokedGetTvShowDetails)
        api.getTvShowDetailsShouldReturnError = false
        
        // When
        sutInteractor.getTVShowDetils(id: "test")
        
        // Then
        XCTAssertTrue(presenter.invokedDidFetchTVShowData)
        XCTAssertEqual(presenter.invokedDidFetchTVShowDataCount, 1)
        XCTAssertTrue(api.invokedGetTvShowDetails)
        XCTAssertEqual(api.invokedGetTvShowDetailsCount, 1)
    }
    
    func test_getTVShowDetils_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(presenter.invokedDidFetchTVShowData)
        XCTAssertFalse(api.invokedGetTvShowDetails)
        api.getTvShowDetailsShouldReturnError = true
        
        // When
        sutInteractor.getTVShowDetils(id: "test")
        
        // Then
        XCTAssertFalse(presenter.invokedDidFetchTVShowData)
        XCTAssertEqual(presenter.invokedDidFetchTVShowDataCount, 0)
        XCTAssertTrue(api.invokedGetTvShowDetails)
        XCTAssertEqual(api.invokedGetTvShowDetailsCount, 1)
    }
    
    func test_getImages_WhenItemTypeMovie_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        api.getImagesShouldReturnError = false
        
        // When
        sutInteractor.getImages(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetImages)
        XCTAssertTrue(presenter.invokedDidFetchImages)
        XCTAssertEqual(api.invokedGetImagesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchImagesCount, 1)
    }
    
    func test_getImages_WhenItemTypeMovie_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        api.getImagesShouldReturnError = true
        
        // When
        sutInteractor.getImages(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        XCTAssertEqual(api.invokedGetImagesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchImagesCount, 0)
    }
    
    func test_getImages_WhenItemTypeTVShow_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        api.getImagesShouldReturnError = false
        
        // When
        sutInteractor.getImages(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetImages)
        XCTAssertTrue(presenter.invokedDidFetchImages)
        XCTAssertEqual(api.invokedGetImagesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchImagesCount, 1)
    }
    
    func test_getImages_WhenItemTypeTVShow_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        api.getImagesShouldReturnError = true
        
        // When
        sutInteractor.getImages(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetImages)
        XCTAssertFalse(presenter.invokedDidFetchImages)
        XCTAssertEqual(api.invokedGetImagesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchImagesCount, 0)
    }
    
    func test_getVideos_WhenItemTypeMovie_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        api.getVideosShouldReturnError = false
        
        // When
        sutInteractor.getVideos(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetVideos)
        XCTAssertTrue(presenter.invokedDidFetchVideos)
        XCTAssertEqual(api.invokedGetVideosCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchVideosCount, 1)
    }
    
    func test_getVideos_WhenItemTypeMovie_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        api.getVideosShouldReturnError = true
        
        // When
        sutInteractor.getVideos(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        XCTAssertEqual(api.invokedGetVideosCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchVideosCount, 0)
    }
    
    func test_getVideos_WhenItemTypeTVShow_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        api.getVideosShouldReturnError = false
        
        // When
        sutInteractor.getVideos(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetVideos)
        XCTAssertTrue(presenter.invokedDidFetchVideos)
        XCTAssertEqual(api.invokedGetVideosCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchVideosCount, 1)
    }
    
    func test_getVideos_WhenItemTypeTVShow_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        api.getVideosShouldReturnError = true
        
        // When
        sutInteractor.getVideos(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetVideos)
        XCTAssertFalse(presenter.invokedDidFetchVideos)
        XCTAssertEqual(api.invokedGetVideosCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchVideosCount, 0)
    }
    
    func test_getSimilarItems_WhenItemTypeMovie_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSimilarMovies)
        XCTAssertFalse(presenter.invokedDidFetchSimilarMovies)
        api.getSimilarMoviesShouldReturnError = false
        
        // When
        sutInteractor.getSimilarItems(page: 1, id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetSimilarMovies)
        XCTAssertTrue(presenter.invokedDidFetchSimilarMovies)
        XCTAssertEqual(api.invokedGetSimilarMoviesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchSimilarMoviesCount, 1)
    }
    
    func test_getSimilarItems_WhenItemTypeMovie_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSimilarMovies)
        XCTAssertFalse(presenter.invokedDidFetchSimilarMovies)
        api.getSimilarMoviesShouldReturnError = true
        
        // When
        sutInteractor.getSimilarItems(page: 1, id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetSimilarMovies)
        XCTAssertFalse(presenter.invokedDidFetchSimilarMovies)
        XCTAssertEqual(api.invokedGetSimilarMoviesCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchSimilarMoviesCount, 0)
    }
    
    func test_getSimilarItems_WhenItemTypeTVShow_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSimilarTVShows)
        XCTAssertFalse(presenter.invokedDidFetchSimilarTVShow)
        api.getSimilarTVShowShouldReturnError = false
        
        // When
        sutInteractor.getSimilarItems(page: 1, id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetSimilarTVShows)
        XCTAssertTrue(presenter.invokedDidFetchSimilarTVShow)
        XCTAssertEqual(api.invokedGetSimilarTVShowsCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchSimilarTVShowCount, 1)
    }
    
    func test_getSimilarItems_WhenItemTypeTVShow_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetSimilarTVShows)
        XCTAssertFalse(presenter.invokedDidFetchSimilarTVShow)
        api.getSimilarTVShowShouldReturnError = true
        
        // When
        sutInteractor.getSimilarItems(page: 1, id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetSimilarTVShows)
        XCTAssertFalse(presenter.invokedDidFetchSimilarTVShow)
        XCTAssertEqual(api.invokedGetSimilarTVShowsCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchSimilarTVShowCount, 0)
    }
    
    func test_getReviewItems_WhenItemTypeMovie_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovieReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        api.getMovieReviewersShouldReturnError = false
        
        // When
        sutInteractor.getReviewItems(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetMovieReviewers)
        XCTAssertTrue(presenter.invokedDidFetchReviews)
        XCTAssertEqual(api.invokedGetMovieReviewersCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchReviewsCount, 1)
    }
    
    func test_getReviewItems_WhenItemTypeMovie_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetMovieReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        api.getMovieReviewersShouldReturnError = true
        
        // When
        sutInteractor.getReviewItems(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(api.invokedGetMovieReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        XCTAssertEqual(api.invokedGetMovieReviewersCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchReviewsCount, 0)
    }
    
    func test_getReviewItems_WhenItemTypeTVShow_SuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTvShowReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        api.getTvShowReviewersShouldReturnError = false
        
        // When
        sutInteractor.getReviewItems(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetTvShowReviewers)
        XCTAssertTrue(presenter.invokedDidFetchReviews)
        XCTAssertEqual(api.invokedGetTvShowReviewersCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchReviewsCount, 1)
    }
    
    func test_getReviewItems_WhenItemTypeTVShow_FailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(api.invokedGetTvShowReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        api.getTvShowReviewersShouldReturnError = true
        
        // When
        sutInteractor.getReviewItems(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(api.invokedGetTvShowReviewers)
        XCTAssertFalse(presenter.invokedDidFetchReviews)
        XCTAssertEqual(api.invokedGetTvShowReviewersCount, 1)
        XCTAssertEqual(presenter.invokedDidFetchReviewsCount, 0)
    }
    
    func test_checkDatasFromFirebase_WhenItemTypeMovie_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        self.firebaseHelperReadingWritingHelper.movieItems = [FavoritesModel(itemId: "test", title: "tesr", imageURL: "test")]
        // When
        sutInteractor.checkDatasFromFirebase(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
    }
    
    func test_checkDatasFromFirebase_WhenItemTypeTVShow_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        self.firebaseHelperReadingWritingHelper.tvShowItems = [FavoritesModel(itemId: "test", title: "tesr", imageURL: "test")]
        // When
        sutInteractor.checkDatasFromFirebase(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
    }
    
    func test_checkDatasFromFirebase_WhenItemTypeMovieAndIsExistNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        self.firebaseHelperReadingWritingHelper.movieItems = nil
        // When
        sutInteractor.checkDatasFromFirebase(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 0)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
    }
    
    func test_checkDatasFromFirebase_WhenItemTypeTVShowAndIsExistNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        self.firebaseHelperReadingWritingHelper.tvShowItems = nil
        // When
        sutInteractor.checkDatasFromFirebase(id: "test", itemType: .tvShow)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 0)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedFetchDataFromFirebaseCount, 1)
    }
    
    func test_saveDataToFirebaseFromInteractor_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStore)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        firebaseHelperReadingWritingHelper.saveDataToFireStoreShouldReturnError = false
        let model = FavoritesModel(itemId: "test", title: "test", imageURL: "test")
        
        // When
        sutInteractor.saveDataToFirebaseFromInteractor(favoriteModel: model, itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStore)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStoreCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
    }
    
    func test_saveDataToFirebaseFromInteractor_WhenFailureOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStore)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        firebaseHelperReadingWritingHelper.saveDataToFireStoreShouldReturnError = true
        let model = FavoritesModel(itemId: "test", title: "test", imageURL: "test")
        
        // When
        sutInteractor.saveDataToFirebaseFromInteractor(favoriteModel: model, itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStore)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedSaveDataToFireStoreCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
    }
    
    func test_deleteDataFromFirebaseFromInteractor_WhenSuccessfulOperation_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        firebaseHelperReadingWritingHelper.deleteDataFromFirebaseShouldReturnError = false
        
        // When
        sutInteractor.deleteDataFromFirebaseFromInteractor(itemId: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
    }
    
    func test_deleteDataFromFirebaseFromInteractor_WhenFailureOperation_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertFalse(presenter.invokedDidFinishedOperationsInInteractor)
        firebaseHelperReadingWritingHelper.deleteDataFromFirebaseShouldReturnError = true
        
        // When
        sutInteractor.deleteDataFromFirebaseFromInteractor(itemId: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebase)
        XCTAssertTrue(presenter.invokedDidFinishedOperationsInInteractor)
        XCTAssertEqual(firebaseHelperReadingWritingHelper.invokedDeleteDataFromFirebaseCount, 1)
        XCTAssertEqual(presenter.invokedDidFinishedOperationsInInteractorCount, 1)
    }
}
