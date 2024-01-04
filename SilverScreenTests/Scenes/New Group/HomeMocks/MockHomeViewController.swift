//
//  MockHomeViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 27.12.2023.
//

@testable import SilverScreen

final class MockHomeViewController: HomeViewControllerProtocol, AlertViewPresenter {
    
    var invokedShowAlert: Bool = false
    var invokedShowAlertCount: Int = 0
    func showAlert(message: String?) {
        self.invokedShowAlert = true
        self.invokedShowAlertCount += 1
    }
    
    
    var invokedUpdateCollectionViews: Bool = false
    var invokedUpdateCollectionViewsCount: Int = 0
    func updateCollectionViews(collectionView: SilverScreen.HomeViewCollectionViews) {
        self.invokedUpdateCollectionViews = true
        self.invokedUpdateCollectionViewsCount += 1
    }
}
