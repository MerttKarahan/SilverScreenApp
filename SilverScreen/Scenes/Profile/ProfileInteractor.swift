//
//  ProfileInteractor.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import Foundation
import UIKit

protocol ProfileInteractorProtocol {
    func savePhotoToFirebase(image: Data)
    func fetchPhotoFromFirebase()
    func fetchProfileDatas()
    func signOut()
}

final class ProfileInteractor: ProfileInteractorProtocol {

    weak var presenter: ProfilePresenterProtocol?
    private var firebaseProfileHelper: FirebaseHelperProfileProtocol?

    init(firebaseProfileHelper: FirebaseHelperProfileProtocol) {
        self.firebaseProfileHelper = firebaseProfileHelper
    }

    func savePhotoToFirebase(image: Data) {
        firebaseProfileHelper?.savedProfilePhotoToFirestore(image: image, completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didSavedPhotoToFirebase(message: success)
            case .failure(let failure):
                self.presenter?.didSavedPhotoToFirebase(message: failure.localizedDescription)
            }
        })
    }

    func fetchPhotoFromFirebase() {
        firebaseProfileHelper?.fetchProfilePhoto(completionHandler: { result in
            switch result {
            case .success(let success):
                self.presenter?.didFetchProfilePhotoFromInteractor(image: success, error: nil)
            case .failure(let failure):
                self.presenter?.didFetchProfilePhotoFromInteractor(image: nil, error: failure)
            }
        })
    }

    func fetchProfileDatas() {
        guard let userDatas = firebaseProfileHelper?.fetchProfileDatas() else { return }
        self.presenter?.didFetchProfileDatasFromInteractor(datas: userDatas)
    }

    func signOut() {
        firebaseProfileHelper?.signOut(completionHandler: { errorMessage in
            self.presenter?.didSignOut(errorMessage: errorMessage)
        })
    }
}
