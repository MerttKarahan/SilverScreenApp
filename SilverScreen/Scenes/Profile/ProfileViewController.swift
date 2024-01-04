//
//  ProfileViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject, AlertViewPresenter {
    func didFinishedFirebaseOperation(message: String)
    func didFinishedFirebaseFetchingPhoto(image: UIImage?)
    func didFinishedFetchingProfileDatas(datas: ProfileDatasModel)
}

final class ProfileViewController: UIViewController, ProfileViewControllerProtocol {

    struct Constants {
        static let logoutButtonBorderColor: UIColor = UIColor(red: 255/255, green: 119/255, blue: 57/255, alpha: 0.8)
    }

    // All IBOutlets should be private. But I want to test them.
    @IBOutlet weak var userIdTitleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userCreatedDateTitleLabel: UILabel!
    @IBOutlet weak var userCreatedDateLabel: UILabel!
    @IBOutlet weak var userMailTitleLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileDetailsView: UIView!
    @IBOutlet weak var profileDetailsHolderView: UIView!
    @IBOutlet weak var logoutButton: UIButton!

    var presenter: ProfilePresenterProtocol?
    var pickerController: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchProfileDatasPresenter()
    }

    private func setupUI() {
        self.profileImageView.setCornerRadius(cornerRadius: self.profileImageView.frame.height / 2)

        self.logoutButton.setBorder(borderWidth: 1.0, borderColor: Constants.logoutButtonBorderColor.cgColor)
        self.logoutButton.setCornerRadius(cornerRadius: 4.0)
        self.profileDetailsView.setCornerRadius(cornerRadius: 10.0)
        self.profileDetailsHolderView.setShadow(shadowColor: UIColor.white.cgColor,
                                                shadowOffSet: CGSize(width: 1, height: 1),
                                                shadowOpacity: 0.3,
                                                shadowRadius: 10.0,
                                                clipsToBounds: true,
                                                masksToBounds: false)
        self.setupTitles()
        self.setupPickerController()
    }

    private func setupTitles() {
        self.logoutButton.setTitle("profileVC.logoutButton.text".localized, for: .normal)
        self.userIdTitleLabel.text = "profileVC.userID.text".localized
        self.userCreatedDateTitleLabel.text = "profileVC.createdDate.text".localized
        self.userMailTitleLabel.text = "profileVC.gmail.text".localized
    }

    private func setupPickerController() {
        self.pickerController = UIImagePickerController()
        self.pickerController?.delegate = self
        self.pickerController?.sourceType = .camera
    }

    private func fetchProfileDatasPresenter() {
        self.presenter?.fetchProfileDatasFromInteractor()
    }

    func didFinishedFirebaseFetchingPhoto(image: UIImage?) {
        if let image = image {
            self.profileImageView.image = image
        }
    }

    func didFinishedFirebaseOperation(message: String) {
        self.showAlert(message: message)
    }

    func didFinishedFetchingProfileDatas(datas: ProfileDatasModel) {
        self.userIdLabel.text = datas.userId
        self.userMailLabel.text = datas.userMail
        self.userCreatedDateLabel.text = datas.accountCreatedDate?.convertToReadableDateString(responseDate: "yyyy-MM-dd HH:mm:ss Z", displayDate: "dd/MM/yyyy HH:mm")
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.presenter?.goBackLoginViewControllerWithLogout()
    }

    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        guard let pickerController = self.pickerController else { return }
        pickerController.allowsEditing = true
        self.present(pickerController, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        self.profileImageView.image = image

        guard let imageData = self.presenter?.convertImageToData(image: image) else { return }
        self.presenter?.savePhotoToFirebaseFromInteractor(imageData: imageData)
        picker.dismiss(animated: true)
    }
}
