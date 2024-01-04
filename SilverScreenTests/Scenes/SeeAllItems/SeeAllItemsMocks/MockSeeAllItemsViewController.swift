//
//  MockSeeAllItemsViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 22.12.2023.
//

@testable import SilverScreen

final class MockSeeAllItemsViewController: SeeAllItemsViewControllerProtocol, AlertViewPresenter {
    
    var invokedShowAlert: Bool = false
    var invokedShowAlertCount: Int = 0
    func showAlert(message: String?) {
        self.invokedShowAlert = true
        self.invokedShowAlertCount += 1
    }

    var invokedUpdateCollectionView: Bool = false
    var invokedUpdateCollectionViewCount: Int = 0
    func updateCollectionView(itemType: SilverScreen.ItemType) {
        self.invokedUpdateCollectionView = true
        self.invokedUpdateCollectionViewCount += 1
    }
}
