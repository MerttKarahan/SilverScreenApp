//
//  MockProfileInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

@testable import SilverScreen
import Foundation

final class MockProfileInteractor: ProfileInteractorProtocol {
    var invokedSignOut: Bool = false
    var invokedSignOutCount: Int = 0
    func signOut() {
        self.invokedSignOut = true
        self.invokedSignOutCount += 1
    }
    
    var invokedSavePhotoToFirebase: Bool = false
    var invokedSavePhotoToFirebaseCount: Int = 0
    func savePhotoToFirebase(image: Data) {
        self.invokedSavePhotoToFirebase = true
        self.invokedSavePhotoToFirebaseCount += 1
    }
    
    var invokedFetchPhotoFromFirebase: Bool = false
    var invokedFetchPhotoFromFirebaseCount: Int = 0
    func fetchPhotoFromFirebase() {
        self.invokedFetchPhotoFromFirebase = true
        self.invokedFetchPhotoFromFirebaseCount += 1
    }
    
    var invokedFetchProfileDatas: Bool = false
    var invokedFetchProfileDatasCount: Int = 0
    func fetchProfileDatas() {
        self.invokedFetchProfileDatas = true
        self.invokedFetchProfileDatasCount += 1
    }
}
