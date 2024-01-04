//
//  MockDetailsViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen
import XCTest

final class MockDetailsViewController: DetailsViewControllerProtocol {
    
    var invokedShowAlert: Bool = false
    var invokedShowAlertCount: Int = 0
    func showAlert(message: String?) {
        self.invokedShowAlert = true
        self.invokedShowAlertCount += 1
    }
    
    var invokedSetupInfoAndOverviewView: Bool = false
    var invokedSetupInfoAndOverviewViewCount: Int = 0
    func setupInfoAndOverviewView(model: Decodable, itemType: SilverScreen.ItemType) {
        self.invokedSetupInfoAndOverviewView = true
        self.invokedSetupInfoAndOverviewViewCount += 1
    }
    
    var invokedSetupSimilarsView: Bool = false
    var invokedSetupSimilarsViewCount: Int = 0
    func setupSimilarsView(model: Decodable) {
        self.invokedSetupSimilarsView = true
        self.invokedSetupSimilarsViewCount += 1
    }
    
    var invokedSetupReviewView: Bool = false
    var invokedSetupReviewViewCount: Int = 0
    func setupReviewView(model: [SilverScreen.ReviewItem]) {
        self.invokedSetupReviewView = true
        self.invokedSetupReviewViewCount += 1
    }
    
    var invokedSetupVideoPlayer: Bool = false
    var invokedSetupVideoPlayerCount: Int = 0
    var setupVideoPlayerExpectation: XCTestExpectation?
    func setupVideoPlayer(with path: String) {
        self.invokedSetupVideoPlayer = true
        self.invokedSetupVideoPlayerCount += 1
        setupVideoPlayerExpectation?.fulfill()
    }
    
    var invokedDidFinishedFirebaseOperation: Bool = false
    var invokedDidFinishedFirebaseOperationCount: Int = 0
    func didFinishedFirebaseOperation(message: String?, isItemExist: Bool?) {
        self.invokedDidFinishedFirebaseOperation = true
        self.invokedDidFinishedFirebaseOperationCount += 1
    }
}
