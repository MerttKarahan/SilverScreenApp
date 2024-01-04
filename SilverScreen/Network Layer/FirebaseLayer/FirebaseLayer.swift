//
//  FirebaseLayer.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 23.11.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

protocol FirebaseHelperLoginProtocol {
    func signInForUser(accountModel: AccountModel, completionHandler: @escaping  (Error?) -> Void)
    func signUpForUser(accountModel: AccountModel, completionHandler: @escaping (Error?) -> Void)
}

protocol FirebaseHelperReadingWritingProtocol {
    func saveDataToFireStore(favoriteModel: FavoritesModel?, itemType: ItemType, completionHandler: @escaping (Result<String, Error>) -> Void)
    func fetchDataFromFirebase(itemType: ItemType, completionHandler: @escaping () -> Void)
    func deleteDataFromFirebase(itemId: String, itemType: ItemType, completionHandler: @escaping (Result<String, Error>) -> Void)
    var movieItems: [FavoritesModel]? { get }
    var tvShowItems: [FavoritesModel]? { get }
}

protocol FirebaseHelperProfileProtocol {
    func savedProfilePhotoToFirestore(image: Data, completionHandler: @escaping (Result<String, Error>) -> Void)
    func fetchProfilePhoto(completionHandler: @escaping (Result<UIImage?, Error>) -> Void)
    func fetchProfileDatas() -> ProfileDatasModel?
    func signOut(completionHandler: @escaping (String?) -> Void)
}

final class FirebaseHelper: FirebaseHelperLoginProtocol, FirebaseHelperReadingWritingProtocol, FirebaseHelperProfileProtocol {

    let firestoreDatabase = Firestore.firestore()
    let firebaseStorage = Storage.storage().reference()

    var movieItems: [FavoritesModel]? = []
    var tvShowItems: [FavoritesModel]? = []

    func signUpForUser(accountModel: AccountModel, completionHandler: @escaping (Error?) -> Void) {
        guard let userMail = accountModel.mail, let userPassword = accountModel.password else { return }
        if accountModel.mail?.isEmpty != true && accountModel.password?.isEmpty != true {
            Auth.auth().createUser(withEmail: userMail, password: userPassword) { _, error in
                if let error = error {
                    completionHandler(error)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }

    func signInForUser(accountModel: AccountModel, completionHandler: @escaping  (Error?) -> Void) {
        guard let userMail = accountModel.mail, let userPassword = accountModel.password else { return }
        if accountModel.mail?.isEmpty != true && accountModel.password?.isEmpty != true {
            Auth.auth().signIn(withEmail: userMail, password: userPassword) { _, error in
                if let error = error {
                    completionHandler(error)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }

    func saveDataToFireStore(favoriteModel: FavoritesModel?, itemType: ItemType, completionHandler: @escaping (Result<String, Error>) -> Void) {
        guard let currentUserUID = Auth.auth().currentUser?.uid, let favoriteModel = favoriteModel else { return }

        let fireStoreItem: [String: String] = ["itemId": favoriteModel.itemId, "title": favoriteModel.title, "image": favoriteModel.imageURL]
        firestoreDatabase.collection("DB").document("\(currentUserUID)").collection("\(itemType.typeName)").document("\(favoriteModel.itemId)").setData(fireStoreItem) { error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success("alertVC.savedSuccessfully.text".localized))
            }
        }
    }

    func fetchDataFromFirebase(itemType: ItemType, completionHandler: @escaping () -> Void) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        self.movieItems = []
        self.tvShowItems = []
        firestoreDatabase.collection("DB").document("\(currentUserUID)").collection("\(itemType.typeName)").getDocuments { snapshot, error in
            if let error = error {
                print(error)
            } else if let snapshots = snapshot?.documents {
                snapshots.forEach { movie in
                    let favoriteItem = FavoritesModel(
                        itemId: movie.get("itemId") as? String ?? "",
                        title: movie.get("title") as? String ?? "",
                        imageURL: movie.get("image") as? String ?? "")
                    switch itemType {
                    case .movie:
                        self.movieItems?.append(favoriteItem)
                    case .tvShow:
                        self.tvShowItems?.append(favoriteItem)
                    }
                }
                completionHandler()
            }
        }
    }

    func deleteDataFromFirebase(itemId: String, itemType: ItemType, completionHandler: @escaping (Result<String, Error>) -> Void) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }

        firestoreDatabase.collection("DB").document("\(currentUserUID)").collection("\(itemType.typeName)").document("\(itemId)").delete { error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success("alertVC.deletedSuccessfully.text".localized))
            }
        }
    }

    func savedProfilePhotoToFirestore(image: Data, completionHandler: @escaping (Result<String, Error>) -> Void) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        let storageRef = firebaseStorage.child("\(currentUserUID).png")

        storageRef.putData(image, metadata: nil) { (_, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success("alertVC.savedSuccessfully.text".localized))
            }
        }
    }

    func fetchProfilePhoto(completionHandler: @escaping (Result<UIImage?, Error>) -> Void) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        let storageRef = firebaseStorage.child("\(currentUserUID).png")

        storageRef.getData(maxSize: 10*1024*1024) { data, error in
            if let error = error {
                guard let errorCode = (error as NSError?)?.code else { return }
                guard let errorType = StorageErrorCode(rawValue: errorCode) else { return }
                switch errorType {
                case .objectNotFound:
                    completionHandler(.success(nil))
                default:
                    completionHandler(.failure(error))
                }
            } else {
                guard let data = data else { return }
                let image = UIImage(data: data)
                completionHandler(.success(image))
            }
        }
    }

    func fetchProfileDatas() -> ProfileDatasModel? {
        guard let user = Auth.auth().currentUser else { return nil }

        let userDatas = ProfileDatasModel(
            userId: user.uid,
            userMail: user.email,
            accountCreatedDate: user.metadata.creationDate?.description)

        return userDatas
    }

    func signOut(completionHandler: @escaping (String?) -> Void) {
        do {
            try Auth.auth().signOut()
            completionHandler(nil)
        } catch {
            completionHandler("profileVC.signOutFailure.text")
        }
    }
}
