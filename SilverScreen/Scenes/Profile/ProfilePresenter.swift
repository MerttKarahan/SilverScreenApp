//
//  ProfilePresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol: AnyObject {
    func goBackLoginViewControllerWithLogout()
    func convertImageToData(image: UIImage) -> Data?
    func savePhotoToFirebaseFromInteractor(imageData: Data)
    func didSavedPhotoToFirebase(message: String)
    func fetchProfileDatasFromInteractor()
    func didFetchProfilePhotoFromInteractor(image: UIImage?, error: Error?)
    func didFetchProfileDatasFromInteractor(datas: ProfileDatasModel)
    func didSignOut(errorMessage: String?)
}

final class ProfilePresenter: ProfilePresenterProtocol {

    private weak var viewController: ProfileViewControllerProtocol?
    private var interactor: ProfileInteractorProtocol?
    private var router: ProfileRouterProtocol?

    init(viewController: ProfileViewControllerProtocol, interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.viewController = viewController
    }

    func convertImageToData(image: UIImage) -> Data? {
        return image.jpegData(compressionQuality: 0.5)
    }

    func savePhotoToFirebaseFromInteractor(imageData: Data) {
        self.interactor?.savePhotoToFirebase(image: imageData)
    }

    func fetchProfileDatasFromInteractor() {
        self.interactor?.fetchPhotoFromFirebase()
        self.interactor?.fetchProfileDatas()
    }

    func didSignOut(errorMessage: String?) {
        if let errorMessage = errorMessage {
            self.viewController?.didFinishedFirebaseOperation(message: errorMessage)
        } else {
            self.router?.goBackLoginViewController()
        }
    }

    func didFetchProfilePhotoFromInteractor(image: UIImage?, error: Error?) {
        if let image = image {
            self.viewController?.didFinishedFirebaseFetchingPhoto(image: image)
        } else if let error = error {
            self.viewController?.didFinishedFirebaseOperation(message: error.localizedDescription)
        }
    }

    func didFetchProfileDatasFromInteractor(datas: ProfileDatasModel) {
        self.viewController?.didFinishedFetchingProfileDatas(datas: datas)
    }

    func didSavedPhotoToFirebase(message: String) {
        self.viewController?.didFinishedFirebaseOperation(message: message)
    }
    
    func goBackLoginViewControllerWithLogout() {
        self.interactor?.signOut()
    }
}
