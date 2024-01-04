//
//  MockDetailsInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen

final class MockDetailsInteractor: DetailsInteractorProtocol {
    
    var invokedGetMovieDetails: Bool = false
    var invokedGetMovieDetailsCount: Int = 0
    func getMovieDetails(id: String) {
        self.invokedGetMovieDetails = true
        self.invokedGetMovieDetailsCount += 1
    }
    
    var invokedGetTVShowDetails: Bool = false
    var invokedGetTVShowDetailsCount: Int = 0
    func getTVShowDetils(id: String) {
        self.invokedGetTVShowDetails = true
        self.invokedGetTVShowDetailsCount += 1
    }
    
    var invokedGetImages: Bool = false
    var invokedGetImagesCount: Int = 0
    func getImages(id: String, itemType: SilverScreen.ItemType) {
        self.invokedGetImages = true
        self.invokedGetImagesCount += 1
    }
    
    var invokedGetVideos: Bool = false
    var invokedGetVideosCount: Int = 0
    func getVideos(id: String, itemType: SilverScreen.ItemType) {
        self.invokedGetVideos = true
        self.invokedGetVideosCount += 1
    }
    
    var invokedGetSimilarItems: Bool = false
    var invokedGetSimilarItemsCount: Int = 0
    func getSimilarItems(page: Int, id: String, itemType: SilverScreen.ItemType) {
        self.invokedGetSimilarItems = true
        self.invokedGetSimilarItemsCount += 1
    }
    
    var invokedGetReviewItems: Bool = false
    var invokedGetReviewItemsCount: Int = 0
    func getReviewItems(id: String, itemType: SilverScreen.ItemType) {
        self.invokedGetReviewItems = true
        self.invokedGetReviewItemsCount += 1
    }
    
    var invokedSaveDataToFirebaseFromInteractor: Bool = false
    var invokedSaveDataToFirebaseFromInteractorCount: Int = 0
    func saveDataToFirebaseFromInteractor(favoriteModel: SilverScreen.FavoritesModel, itemType: SilverScreen.ItemType) {
        self.invokedSaveDataToFirebaseFromInteractor = true
        self.invokedSaveDataToFirebaseFromInteractorCount += 1
    }
    
    var invokedDeleteDataFromFirebaseFromInteractor: Bool = false
    var invokedDeleteDataFromFirebaseFromInteractorCount: Int = 0
    func deleteDataFromFirebaseFromInteractor(itemId: String, itemType: SilverScreen.ItemType) {
        self.invokedDeleteDataFromFirebaseFromInteractor = true
        self.invokedDeleteDataFromFirebaseFromInteractorCount += 1
    }
    
    var invokedCheckDatasFromFirebase: Bool = false
    var invokedCheckDatasFromFirebaseCount: Int = 0
    func checkDatasFromFirebase(id: String, itemType: SilverScreen.ItemType) {
        self.invokedCheckDatasFromFirebase = true
        self.invokedCheckDatasFromFirebaseCount += 1
    }
}
