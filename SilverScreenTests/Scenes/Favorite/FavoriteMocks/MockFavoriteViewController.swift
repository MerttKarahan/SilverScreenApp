//
//  MockFavoriteViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 21.12.2023.
//

@testable import SilverScreen

final class MockFavoriteViewController: FavoritesViewControllerProtocol, AlertViewPresenter {
    func showAlert(message: String?) {
        
    }
    
    var invokedReloadTableView: Bool = false
    var invokedReloadTableViewCount: Int = 0
    func reloadTableView() {
        self.invokedReloadTableView = true
        self.invokedReloadTableViewCount += 1
    }
    
    var invokedDidDeletedItem: Bool = false
    var invokedDidDeletedItemCount: Int = 0
    func didDeletedItem(message: String) {
        self.invokedDidDeletedItem = true
        self.invokedDidDeletedItemCount += 1
    }
}
