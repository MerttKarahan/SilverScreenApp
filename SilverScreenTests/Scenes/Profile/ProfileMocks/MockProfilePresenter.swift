//
//  MockProfilePresenter.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

@testable import SilverScreen
import UIKit

final class MockProfilePresenter: ProfilePresenterProtocol {
    
    var invokedDidSignOut: Bool = false
    var invokedDidSignOutCount: Int = 0
    func didSignOut(errorMessage: String?) {
        self.invokedDidSignOut = true
        self.invokedDidSignOutCount += 1
    }
    
    var invokesGoBackLoginViewControllerWithLogout: Bool = false
    var invokesGoBackLoginViewControllerWithLogoutCount: Int = 0
    func goBackLoginViewControllerWithLogout() {
        self.invokesGoBackLoginViewControllerWithLogout = true
        self.invokesGoBackLoginViewControllerWithLogoutCount += 1
    }
    
    func convertImageToData(image: UIImage) -> Data? {
        return Data([])
    }
    
    func savePhotoToFirebaseFromInteractor(imageData: Data) {
        
    }
    
    var invokesDidSavedPhotoToFirebase: Bool = false
    var invokesDidSavedPhotoToFirebaseCount: Int = 0
    func didSavedPhotoToFirebase(message: String) {
        self.invokesDidSavedPhotoToFirebase = true
        self.invokesDidSavedPhotoToFirebaseCount += 1
    }
    
    
    var invokesFetchProfileDatasFromInteractor: Bool = false
    var invokesFetchProfileDatasFromInteractorCount: Int = 0
    func fetchProfileDatasFromInteractor() {
        self.invokesFetchProfileDatasFromInteractor = true
        self.invokesFetchProfileDatasFromInteractorCount += 1
    }
    
    var invokesDidFetchProfilePhotoFromInteractor: Bool = false
    var invokesDidFetchProfilePhotoFromInteractorCount: Int = 0
    func didFetchProfilePhotoFromInteractor(image: UIImage?, error: Error?) {
        self.invokesDidFetchProfilePhotoFromInteractor = true
        self.invokesDidFetchProfilePhotoFromInteractorCount += 1
    }
    
    var invokesDidFetchProfileDatasFromInteractor: Bool = false
    var invokesDidFetchProfileDatasFromInteractorCount: Int = 0
    func didFetchProfileDatasFromInteractor(datas: SilverScreen.ProfileDatasModel) {
        self.invokesDidFetchProfileDatasFromInteractor = true
        self.invokesDidFetchProfileDatasFromInteractorCount += 1
    }
}
