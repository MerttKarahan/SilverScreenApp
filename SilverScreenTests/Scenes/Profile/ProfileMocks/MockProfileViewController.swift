//
//  MockProfileViewController.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 12.12.2023.
//

@testable import SilverScreen
import UIKit

final class MockProfileViewController: ProfileViewControllerProtocol {
    func showAlert(message: String?) {
        
    }
    
    
    var invokedDidFinishedFirebaseOperation: Bool = false
    var invokedDidFinishedFirebaseOperationCount: Int = 0
    func didFinishedFirebaseOperation(message: String) {
        self.invokedDidFinishedFirebaseOperation = true
        self.invokedDidFinishedFirebaseOperationCount += 1
    }
    
    var invokedDidFinishedFirebaseFetchingPhoto: Bool = false
    var invokedDidFinishedFirebaseFetchingPhotoCount: Int = 0
    func didFinishedFirebaseFetchingPhoto(image: UIImage?) {
        self.invokedDidFinishedFirebaseFetchingPhoto = true
        self.invokedDidFinishedFirebaseFetchingPhotoCount += 1
    }
    
    var invokedDidFinishedFetchingProfileDatas: Bool = false
    var invokedDidFİnishedFetchingProfileDatasCount: Int = 0
    func didFinishedFetchingProfileDatas(datas: SilverScreen.ProfileDatasModel) {
        self.invokedDidFinishedFetchingProfileDatas = true
        self.invokedDidFİnishedFetchingProfileDatasCount += 1
    }
}
