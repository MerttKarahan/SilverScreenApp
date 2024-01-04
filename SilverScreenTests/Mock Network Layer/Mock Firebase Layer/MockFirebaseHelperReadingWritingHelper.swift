//
//  MockFirebaseHelperReadingWritingHelper.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

@testable import SilverScreen
import UIKit

final class MockFirebaseHelperReadingWritingHelper: FirebaseHelperReadingWritingProtocol {
    
    var movieItems: [SilverScreen.FavoritesModel]?
    var tvShowItems: [SilverScreen.FavoritesModel]?
    
    var invokedSaveDataToFireStore: Bool = false
    var invokedSaveDataToFireStoreCount: Int = 0
    var saveDataToFireStoreShouldReturnError: Bool = false
    func saveDataToFireStore(favoriteModel: SilverScreen.FavoritesModel?, itemType: SilverScreen.ItemType, completionHandler: @escaping (Result<String, Error>) -> Void) {
        self.invokedSaveDataToFireStore = true
        self.invokedSaveDataToFireStoreCount += 1
        if saveDataToFireStoreShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(""))
        }
    }
    
    var invokedFetchDataFromFirebase: Bool = false
    var invokedFetchDataFromFirebaseCount: Int = 0
    func fetchDataFromFirebase(itemType: SilverScreen.ItemType, completionHandler: @escaping () -> Void) {
        self.invokedFetchDataFromFirebase = true
        self.invokedFetchDataFromFirebaseCount += 1
        completionHandler()
    }
    
    
    var invokedDeleteDataFromFirebase: Bool = false
    var invokedDeleteDataFromFirebaseCount: Int = 0
    var deleteDataFromFirebaseShouldReturnError: Bool = false
    func deleteDataFromFirebase(itemId: String, itemType: SilverScreen.ItemType, completionHandler: @escaping (Result<String, Error>) -> Void) {
        self.invokedDeleteDataFromFirebase = true
        self.invokedDeleteDataFromFirebaseCount += 1
        if deleteDataFromFirebaseShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1, userInfo: [:])))
        } else {
            completionHandler(.success("testSuccess"))
        }
    }
}
