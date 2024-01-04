//
//  DetailsPresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen
import XCTest

final class DetailsPresenterTests: BaseXCTestCase {
    private var sutPresenter: DetailsPresenter!
    private var interactor: MockDetailsInteractor!
    private var viewController: MockDetailsViewController!
    private var router: MockDetailsRouter!
    
    override func setUp() {
        super.setUp()
        self.viewController = .init()
        self.interactor = .init()
        self.router = .init()
        self.sutPresenter = .init(viewController: viewController, interactor: interactor, router: router, id: nil, itemType: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewController = nil
        self.interactor = nil
        self.router = nil
        self.sutPresenter = nil
        print("testbitti!!!!!!")
    }
    
    func test_getDataFromInteractor_WhenItemTypeMovieAndHasId_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(interactor.invokedGetMovieDetails)
        XCTAssertFalse(interactor.invokedGetImages)
        XCTAssertFalse(interactor.invokedGetVideos)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        
        // When
        sutPresenter.getDataFromInteractor()
        
        // Then
        XCTAssertTrue(interactor.invokedGetMovieDetails)
        XCTAssertEqual(interactor.invokedGetMovieDetailsCount, 1)
        XCTAssertTrue(interactor.invokedGetImages)
        XCTAssertEqual(interactor.invokedGetImagesCount, 1)
        XCTAssertTrue(interactor.invokedGetVideos)
        XCTAssertEqual(interactor.invokedGetVideosCount, 1)
    }
    
    func test_getDataFromInteractor_WhenItemTypeTVShowAndHasId_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(interactor.invokedGetTVShowDetails)
        XCTAssertFalse(interactor.invokedGetImages)
        XCTAssertFalse(interactor.invokedGetVideos)
        sutPresenter.itemType = .tvShow
        sutPresenter.id = "test"
        
        // When
        sutPresenter.getDataFromInteractor()
        
        // Then
        XCTAssertTrue(interactor.invokedGetTVShowDetails)
        XCTAssertEqual(interactor.invokedGetTVShowDetailsCount, 1)
        XCTAssertTrue(interactor.invokedGetImages)
        XCTAssertEqual(interactor.invokedGetImagesCount, 1)
        XCTAssertTrue(interactor.invokedGetVideos)
        XCTAssertEqual(interactor.invokedGetVideosCount, 1)
    }
    
    func test_getDataFromInteractor_WhenItemTypeAndIdNil_ShouldNotInvokesRequiredMethods() {
        // Given
        XCTAssertFalse(interactor.invokedGetMovieDetails)
        XCTAssertFalse(interactor.invokedGetImages)
        XCTAssertFalse(interactor.invokedGetVideos)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        
        // When
        sutPresenter.getDataFromInteractor()
        
        // Then
        XCTAssertFalse(interactor.invokedGetMovieDetails)
        XCTAssertEqual(interactor.invokedGetMovieDetailsCount, 0)
        XCTAssertFalse(interactor.invokedGetImages)
        XCTAssertEqual(interactor.invokedGetImagesCount, 0)
        XCTAssertFalse(interactor.invokedGetVideos)
        XCTAssertEqual(interactor.invokedGetVideosCount, 0)
    }
    
    func test_getSimilarItemFromInteractor_WhenHasItemTypeAndId_InvokesRequiredMethods() {
        // Given
        XCTAssertFalse(interactor.invokedGetSimilarItems)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        // When
        sutPresenter.getSimilarItemFromInteractor(page: nil)
        
        // Then
        XCTAssertTrue(interactor.invokedGetSimilarItems)
        XCTAssertEqual(interactor.invokedGetSimilarItemsCount, 1)
    }
    
    func test_getSimilarItemFromInteractor_WhenItemTypeAndIdNil_ShouldNotInvokesRequiredMethods() {
        // Given
        XCTAssertFalse(interactor.invokedGetSimilarItems)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        // When
        sutPresenter.getSimilarItemFromInteractor(page: nil)
        
        // Then
        XCTAssertFalse(interactor.invokedGetSimilarItems)
        XCTAssertEqual(interactor.invokedGetSimilarItemsCount, 0)
    }
    
    func test_getReviewItemsFromInteractor_WhenHasItemTypeAndId_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetReviewItems)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        
        // When
        sutPresenter.getReviewItemsFromInteractor()
        
        // Then
        XCTAssertTrue(interactor.invokedGetReviewItems)
        XCTAssertEqual(interactor.invokedGetReviewItemsCount, 1)
    }
    
    func test_getReviewItemsFromInteractor_WhenItemTypeAndIdNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedGetReviewItems)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        
        // When
        sutPresenter.getReviewItemsFromInteractor()
        
        // Then
        XCTAssertFalse(interactor.invokedGetReviewItems)
        XCTAssertEqual(interactor.invokedGetReviewItemsCount, 0)
    }
    
    func test_didFetchMovieData_WhenHasItemTypeAndId_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        sutPresenter.itemType = .movie
        let model = unitTestHelper.createMoviesDetailResult()
        // When
        sutPresenter.didFetchMovieData(model: model)
        
        // Then
        XCTAssertNotNil(sutPresenter.movieItem)
        XCTAssertTrue(viewController.invokedSetupInfoAndOverviewView)
        XCTAssertEqual(viewController.invokedSetupInfoAndOverviewViewCount, 1)
    }
    
    func test_didFetchMovieData_WhenItemTypeAndIdNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        sutPresenter.itemType = nil
        let model = unitTestHelper.createMoviesDetailResult()
        // When
        sutPresenter.didFetchMovieData(model: model)
        
        // Then
        XCTAssertNil(sutPresenter.movieItem)
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        XCTAssertEqual(viewController.invokedSetupInfoAndOverviewViewCount, 0)
    }
    
    func test_didFetchTVShowData_WhenHasItemTypeAndId_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        sutPresenter.itemType = .movie
        let model = unitTestHelper.createTVShowsDetailResult()
        // When
        sutPresenter.didFetchTVShowData(model: model)

        // Then
        XCTAssertNotNil(sutPresenter.tvShowItem)
        XCTAssertTrue(viewController.invokedSetupInfoAndOverviewView)
        XCTAssertEqual(viewController.invokedSetupInfoAndOverviewViewCount, 1)
    }
    
    func test_didFetchTVShowData_WhenItemTypeAndIdNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        sutPresenter.itemType = nil
        let model = unitTestHelper.createTVShowsDetailResult()
        // When
        sutPresenter.didFetchTVShowData(model: model)
        
        // Then
        XCTAssertNil(sutPresenter.tvShowItem)
        XCTAssertFalse(viewController.invokedSetupInfoAndOverviewView)
        XCTAssertEqual(viewController.invokedSetupInfoAndOverviewViewCount, 0)
    }
    
    func test_didFetchImages_ImagesShouldNotReturnNil() {
        // Given
        XCTAssertNil(sutPresenter.images)
        let model = unitTestHelper.createImageResult()
        
        // When
        sutPresenter.didFetchImages(model: model)
        
        // Then
        XCTAssertNotNil(sutPresenter.images)
    }
    
    func test_didFetchVideos_WhenVideosNotEmpty_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupVideoPlayer)
        let model = unitTestHelper.createVideosModel()
        let expectation = self.expectation(description: "expectation")
        viewController.setupVideoPlayerExpectation = expectation
        
        // When
        sutPresenter.didFetchVideos(model: model)
        self.wait(for: [expectation], timeout: 3)
        
        // Then
        XCTAssertNotNil(sutPresenter.videos)
        XCTAssertTrue(viewController.invokedSetupVideoPlayer)
        XCTAssertEqual(viewController.invokedSetupVideoPlayerCount, 1)
    }
    
    func test_didFetchVideos_WhenVideosEmpty_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupVideoPlayer)
        let model = unitTestHelper.createVideosModel(isEmpty: true)
        let expectation = self.expectation(description: "expectation")
        viewController.setupVideoPlayerExpectation = expectation
        
        // When
        sutPresenter.didFetchVideos(model: model)
        self.wait(for: [expectation], timeout: 3)
        
        // Then
        XCTAssertNotNil(sutPresenter.videos)
        XCTAssertTrue(viewController.invokedSetupVideoPlayer)
        XCTAssertEqual(viewController.invokedSetupVideoPlayerCount, 1)
    }
    
    func test_didFetchSimilarMovies_WhenSimilarMoviesNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupSimilarsView)
        let model = unitTestHelper.createMoviesItemResult()
        sutPresenter.similarMovies = unitTestHelper.createMovieItemsArray( numberOfItems: 2)
        
        // When
        sutPresenter.didFetchSimilarMovies(model: model)
        
        //Then
        XCTAssertEqual(sutPresenter.similarMovies?.count, 2)
        XCTAssertNil(sutPresenter.similarMoviesPage)
        XCTAssertTrue(viewController.invokedSetupSimilarsView)
        XCTAssertEqual(viewController.invokedSetupSimilarsViewCount, 1)
    }
    
    func test_didFetchSimilarMovies_WhenSimilarMoviesNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupSimilarsView)
        let model = unitTestHelper.createMoviesItemResult()
        sutPresenter.similarMovies = nil
        
        // When
        sutPresenter.didFetchSimilarMovies(model: model)
        
        //Then
        XCTAssertEqual(sutPresenter.similarMovies, model.results)
        XCTAssertNil(sutPresenter.similarMoviesPage)
        XCTAssertTrue(viewController.invokedSetupSimilarsView)
        XCTAssertEqual(viewController.invokedSetupSimilarsViewCount, 1)
    }
    
    func test_didFetchSimilarTVShows_WhenSimilarTVShowsNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupSimilarsView)
        let model = unitTestHelper.createTVShowsItemResult()
        sutPresenter.similarTVShows = unitTestHelper.createTVShowItemsArray(numberOfItems: 2)
        
        // When
        sutPresenter.didFetchSimilarTVShows(model: model)
        
        //Then
        XCTAssertEqual(sutPresenter.similarTVShows?.count, 2)
        XCTAssertNil(sutPresenter.similarTVShowsPage)
        XCTAssertTrue(viewController.invokedSetupSimilarsView)
        XCTAssertEqual(viewController.invokedSetupSimilarsViewCount, 1)
    }
    
    func test_didFetchSimilarTVShows_WhenSimilarTVShowsNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupSimilarsView)
        let model = unitTestHelper.createTVShowsItemResult()
        sutPresenter.similarTVShows = nil
        
        // When
        sutPresenter.didFetchSimilarTVShows(model: model)
        
        //Then
        XCTAssertEqual(sutPresenter.similarTVShows, model.results)
        XCTAssertNil(sutPresenter.similarTVShowsPage)
        XCTAssertTrue(viewController.invokedSetupSimilarsView)
        XCTAssertEqual(viewController.invokedSetupSimilarsViewCount, 1)
    }
    
    func test_didFetchReviews_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupReviewView)
        let model = unitTestHelper.createReviewersResult()
        
        // When
        sutPresenter.didFetchReviews(model: model)
        
        // Then
        XCTAssertNil(sutPresenter.reviews)
        XCTAssertTrue(viewController.invokedSetupReviewView)
        XCTAssertEqual(viewController.invokedSetupReviewViewCount, 1)
    }
    
    func test_refreshVideo_WhenVideosNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupVideoPlayer)
        sutPresenter.videos = unitTestHelper.createVideosModel()
        
        // When
        sutPresenter.refreshVideo()
        
        // Then
        XCTAssertTrue(viewController.invokedSetupVideoPlayer)
        XCTAssertEqual(viewController.invokedSetupVideoPlayerCount, 1)
    }
    
    func test_refreshVideo_WhenVideosNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedSetupVideoPlayer)
        sutPresenter.videos = nil
        
        // When
        sutPresenter.refreshVideo()
        
        // Then
        XCTAssertFalse(viewController.invokedSetupVideoPlayer)
        XCTAssertEqual(viewController.invokedSetupVideoPlayerCount, 0)
    }
    
    func test_goBackHomeViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedGoBack)
        
        // When
        sutPresenter.goBackHomeViewController()
        
        // Then
        XCTAssertTrue(router.invokedGoBack)
        XCTAssertEqual(router.invokedGoBackCount, 1)
    }
    
    func test_pushToOtherDetailsViewController_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(router.invokedPushOtherDetailsViewController)
        
        // When
        sutPresenter.pushToOtherDetailsViewController(id: "test", itemType: .movie)
        
        // Then
        XCTAssertTrue(router.invokedPushOtherDetailsViewController)
        XCTAssertEqual(router.invokedPushOtherDetailsViewControllerCount, 1)
    }
    
    func test_checkFirebaseDatasFromInteractor_WhenItemTypeAndIdNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedCheckDatasFromFirebase)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        
        // When
        sutPresenter.checkFirebaseDatasFromInteractor()
        
        // Then
        XCTAssertTrue(interactor.invokedCheckDatasFromFirebase)
        XCTAssertEqual(interactor.invokedCheckDatasFromFirebaseCount, 1)
    }
    
    func test_checkFirebaseDatasFromInteractor_WhenItemTypeAndIdNil_ShouldNotInvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedCheckDatasFromFirebase)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        
        // When
        sutPresenter.checkFirebaseDatasFromInteractor()
        
        // Then
        XCTAssertFalse(interactor.invokedCheckDatasFromFirebase)
        XCTAssertEqual(interactor.invokedCheckDatasFromFirebaseCount, 0)
    }
    
    func test_deleteDataFromFirebase_WhenItemTypeAndIdNotNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedDeleteDataFromFirebaseFromInteractor)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        
        // When
        sutPresenter.deleteDataFromFirebase()
        
        // Then
        XCTAssertTrue(interactor.invokedDeleteDataFromFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedDeleteDataFromFirebaseFromInteractorCount, 1)
    }
    
    func test_deleteDataFromFirebase_WhenItemTypeAndIdNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedDeleteDataFromFirebaseFromInteractor)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        
        // When
        sutPresenter.deleteDataFromFirebase()
        
        // Then
        XCTAssertFalse(interactor.invokedDeleteDataFromFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedDeleteDataFromFirebaseFromInteractorCount, 0)
    }
    
    func test_didFinishedOperationsInInteractor_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedDidFinishedFirebaseOperation)
        
        // When
        sutPresenter.didFinishedOperationsInInteractor(message: "test", isItemExist: true)
        
        // Then
        XCTAssertTrue(viewController.invokedDidFinishedFirebaseOperation)
        XCTAssertEqual(viewController.invokedDidFinishedFirebaseOperationCount, 1)
    }

    func test_saveDataToFirebase_WhenItemTypeMovieAndHasId_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        sutPresenter.itemType = .movie
        sutPresenter.id = "test"
        sutPresenter.movieItem = unitTestHelper.createMoviesDetailResult()
        
        // When
        sutPresenter.saveDataToFireBase()
        
        // Then
        XCTAssertTrue(interactor.invokedSaveDataToFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedSaveDataToFirebaseFromInteractorCount, 1)
    }
    
    func test_saveDataToFirebase_WhenItemTypeTVShowAndHasId_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        sutPresenter.itemType = .tvShow
        sutPresenter.id = "test"
        sutPresenter.tvShowItem = unitTestHelper.createTVShowsDetailResult()
        
        // When
        sutPresenter.saveDataToFireBase()
        
        // Then
        XCTAssertTrue(interactor.invokedSaveDataToFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedSaveDataToFirebaseFromInteractorCount, 1)
    }
    
    func test_saveDataToFirebase_WhenItemTypeAndIdNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        sutPresenter.itemType = nil
        sutPresenter.id = nil
        sutPresenter.tvShowItem = unitTestHelper.createTVShowsDetailResult()
        
        // When
        sutPresenter.saveDataToFireBase()
        
        // Then
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedSaveDataToFirebaseFromInteractorCount, 0)
    }
    
    func test_saveDataToFirebase_WhenTitleImageUrlNil_InvokesRequiredMethod() {
        // Given
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        sutPresenter.itemType = .tvShow
        sutPresenter.id = "test"
        sutPresenter.tvShowItem = unitTestHelper.createTVShowsDetailResult()
        sutPresenter.tvShowItem?.name = nil
        sutPresenter.tvShowItem?.poster_path = nil
        
        // When
        sutPresenter.saveDataToFireBase()
        
        // Then
        XCTAssertFalse(interactor.invokedSaveDataToFirebaseFromInteractor)
        XCTAssertEqual(interactor.invokedSaveDataToFirebaseFromInteractorCount, 0)
    }
    
    func test_showAlert_InvokesReuqiredMethod() {
        // Given
        XCTAssertFalse(viewController.invokedShowAlert)
        
        // When
        sutPresenter.showAlert(message: "test")
        
        // Then
        XCTAssertTrue(viewController.invokedShowAlert)
        XCTAssertEqual(viewController.invokedShowAlertCount, 1)
    }
}
