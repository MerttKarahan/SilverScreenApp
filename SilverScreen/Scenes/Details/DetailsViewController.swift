//
//  DetailsViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 12.11.2023.
//

import UIKit
import YouTubeiOSPlayerHelper

protocol DetailsViewControllerProtocol: AnyObject, AlertViewPresenter {
    func setupInfoAndOverviewView(model: Decodable, itemType: ItemType)
    func setupSimilarsView(model: Decodable)
    func setupReviewView(model: [ReviewItem])
    func setupVideoPlayer(with path: String)
    func didFinishedFirebaseOperation(message: String?, isItemExist: Bool?)
}

final class DetailsViewController: UIViewController, DetailsViewControllerProtocol {

    struct Constants {
        static let navigationControllerBackgroundColor: UIColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
    }

    @IBOutlet private weak var activityIndicatorView: ActivityIndicatorView!
    @IBOutlet private weak var playerHolderView: UIView!
    @IBOutlet private weak var playerView: YTPlayerView!
    @IBOutlet private weak var infoHolderView: UIView!
    @IBOutlet private weak var infoView: UIView!
    @IBOutlet private weak var overviewHolderView: UIView!
    @IBOutlet private weak var overviewView: UIView!
    @IBOutlet private weak var similarsHolderView: UIView!
    @IBOutlet private weak var similarsView: ItemsCollectionView!
    @IBOutlet private weak var reviewHolderView: UIView!
    @IBOutlet private weak var removeFromFavoritesButton: UIButton!
    @IBOutlet private weak var addToFireBaseButton: UIButton!
    @IBOutlet private weak var reviewView: ItemsTableView!

    @IBOutlet private weak var timeSeasonTitleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet private weak var timeOrSeasonLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var tagLineLabel: UILabel!
    @IBOutlet private weak var overViewTextView: UITextView!

    @IBOutlet private weak var reviewsLabel: UILabel!
    @IBOutlet private weak var similarLabel: UILabel!
    @IBOutlet private weak var overViewLabel: UILabel!
    @IBOutlet private weak var titleOfVoteAverageLabel: UILabel!
    @IBOutlet private weak var titleOfLanguageLabel: UILabel!
    @IBOutlet private weak var titleOfGenreLabel: UILabel!
    @IBOutlet private weak var titleOfStateLabel: UILabel!
    @IBOutlet private weak var titleOfTitleLabel: UILabel!
    @IBOutlet private weak var titleOfReleaseDateLabel: UILabel!
    var presenter: DetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsUI()
        fetchAllDatas()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }

    private func setupViewsUI() {
        self.infoView.setCornerRadius(cornerRadius: 10.0)
        self.overviewView.setCornerRadius(cornerRadius: 10.0)
        self.similarsView.setCornerRadius(cornerRadius: 10.0)
        self.reviewView.setCornerRadius(cornerRadius: 10.0)
        self.addToFireBaseButton.setBorder(borderWidth: 1.0, borderColor: UIColor.lightGray.cgColor)
        self.addToFireBaseButton.setCornerRadius(cornerRadius: 4.0)
        self.removeFromFavoritesButton.setBorder(borderWidth: 1.0, borderColor: UIColor.lightGray.cgColor)
        self.removeFromFavoritesButton.setCornerRadius(cornerRadius: 4.0)

        self.infoHolderView.setShadow(shadowColor: UIColor.white.cgColor,
                                             shadowOffSet: CGSize(width: 1, height: 1),
                                             shadowOpacity: 0.3,
                                             shadowRadius: 10.0,
                                             clipsToBounds: true,
                                             masksToBounds: false)
        self.overviewHolderView.setShadow(shadowColor: UIColor.white.cgColor,
                                             shadowOffSet: CGSize(width: 1, height: 1),
                                             shadowOpacity: 0.3,
                                             shadowRadius: 10.0,
                                             clipsToBounds: true,
                                             masksToBounds: false)
        self.similarsHolderView.setShadow(shadowColor: UIColor.white.cgColor,
                                             shadowOffSet: CGSize(width: 1, height: 1),
                                             shadowOpacity: 0.3,
                                             shadowRadius: 10.0,
                                             clipsToBounds: true,
                                             masksToBounds: false)
        self.reviewHolderView.setShadow(shadowColor: UIColor.white.cgColor,
                                             shadowOffSet: CGSize(width: 1, height: 1),
                                             shadowOpacity: 0.3,
                                             shadowRadius: 10.0,
                                             clipsToBounds: true,
                                             masksToBounds: false)
        self.setupTitles()
    }

    private func setupTitles() {
        self.addToFireBaseButton.setTitle("detailsVC.addFavoritesButton.title".localized, for: .normal)
        self.removeFromFavoritesButton.setTitle("detailsVC.removeFavoritesButton.title".localized, for: .normal)
        self.reviewsLabel.text = "detailsVC.reviewsView.title".localized
        self.similarLabel.text = "detailsVC.similarView.title".localized
        self.overViewLabel.text = "detailsVC.overviewView.title".localized
        self.titleOfVoteAverageLabel.text = "detailsVC.voteAverage.title".localized
        self.titleOfLanguageLabel.text = "detailsVC.language.title".localized
        self.titleOfGenreLabel.text = "detailsVC.genre.title".localized
        self.titleOfStateLabel.text = "detailsVC.state.title".localized
        self.titleOfTitleLabel.text = "detailsVC.title.title".localized
        self.titleOfReleaseDateLabel.text = "detailsVC.releaseDate.title".localized
    }

    func setupInfoAndOverviewView(model: Decodable, itemType: ItemType) {
        self.imageView.setCornerRadius(cornerRadius: 10.0, clipsToBounds: false, masksToBounds: true)
        switch itemType {
        case .movie:
            guard let item = self.presenter?.movieItem else { return }
            self.imageView.setImage(path: item.poster_path ?? "")
            self.titleLabel.text = item.title
            self.stateLabel.text = item.production_countries?.first?.name
            self.releaseDateLabel.text = item.release_date
            self.genresLabel.text = item.genres?.first?.name
            self.timeOrSeasonLabel.text = "\(item.runtime?.description ?? "")" + "detailsVC.minutes.label".localized
            self.voteAverageLabel.text = "\(item.vote_average?.description ?? "") / 10 (\(item.vote_count?.description ?? ""))"
            self.languageLabel.text = item.original_language
            self.tagLineLabel.text = item.tagline
            self.overViewTextView.text = item.overview
            self.timeSeasonTitleLabel.text = "detailsVC.time.title".localized
        case .tvShow:
            guard let item = self.presenter?.tvShowItem else { return }
            self.imageView.setImage(path: item.poster_path ?? "")
            self.titleLabel.text = item.name
            self.stateLabel.text = item.production_countries?.first?.name
            self.releaseDateLabel.text = item.first_air_date
            self.genresLabel.text = item.genres?.first?.name
            self.timeOrSeasonLabel.text = "\(item.number_of_seasons?.description ?? "") / \(item.number_of_episodes?.description ?? "")"
            self.voteAverageLabel.text = "\(item.vote_average?.description ?? "") / 10 (\(item.vote_count?.description ?? ""))"
            self.languageLabel.text = item.original_language
            self.tagLineLabel.text = item.tagline
            self.overViewTextView.text = item.overview
            self.timeSeasonTitleLabel.text = "detailsVC.seasonEpisode.title".localized
        }
    }

    func setupSimilarsView(model: Decodable) {
        guard let itemType = self.presenter?.itemType else { return }
        switch itemType {
        case.movie:
            self.similarsView.configureMovies(model: self.presenter?.similarMovies ?? [])
            self.similarsView.itemsCollectionViewDelegate = self
        case.tvShow:
            self.similarsView.configureTVShows(model: self.presenter?.similarTVShows ?? [])
            self.similarsView.itemsCollectionViewDelegate = self
        }
    }

    func setupReviewView(model: [ReviewItem]) {
        self.reviewView.configure(model: model)
    }

    func setupVideoPlayer(with path: String) {
        self.playerView.setCornerRadius(cornerRadius: 10.0)
        self.playerView.load(withVideoId: path)
        self.shouldShowActivityIndicator(shouldShow: false)
    }
    
    private func setupNavigationController() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "refresh_icon"), style: .plain, target: self, action: #selector(didTappedNewVideoButton))
        self.navigationItem.rightBarButtonItem?.tintColor = .orange
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_arrow_icon"), style: .plain, target: self, action: #selector(didTappedBackButton))
        self.navigationItem.leftBarButtonItem?.tintColor = .orange
        self.navigationItem.title = "detailsVC.navigationBar.title".localized
    }

    private func fetchAllDatas() {
        self.shouldShowActivityIndicator(shouldShow: true)
        self.presenter?.getDataFromInteractor()
        self.presenter?.getSimilarItemFromInteractor(page: nil)
        self.presenter?.getReviewItemsFromInteractor()
        self.presenter?.checkFirebaseDatasFromInteractor()
    }

    private func shouldShowActivityIndicator(shouldShow: Bool) {
        if shouldShow {
            self.playerView.isHidden = shouldShow
            self.activityIndicatorView.isHidden = !shouldShow
            self.activityIndicatorView.configure(title: .downloadingVideo)
            self.activityIndicatorView.startActivity()
        } else {
            self.playerView.isHidden = shouldShow
            self.activityIndicatorView.isHidden = !shouldShow
            self.activityIndicatorView.stopActivity()
        }
    }

    @objc private func didTappedBackButton() {
        self.presenter?.goBackHomeViewController()
    }

    @objc private func didTappedNewVideoButton() {
        self.presenter?.refreshVideo()
    }

    func didFinishedFirebaseOperation(message: String?, isItemExist: Bool?) {
        guard let isExist = isItemExist else { return }
        if let message = message {
            self.showAlert(message: message)
            self.removeFromFavoritesButton.isHidden = isExist ? false : true
            self.addToFireBaseButton.isHidden = isExist ? true : false
        } else {
            self.addToFireBaseButton.isHidden = isExist
            self.removeFromFavoritesButton.isHidden = !isExist
        }
    }

    @IBAction func removeFromFavoritesButtonTapped(_ sender: Any) {
        self.presenter?.deleteDataFromFirebase()
    }
    @IBAction func addToFavoritesButtonTapped(_ sender: Any) {
        self.presenter?.saveDataToFireBase()
    }
}

extension DetailsViewController: ItemsCollectionViewDelegate {
    func didTappedItem(id: String, itemType: ItemType) {
        self.presenter?.pushToOtherDetailsViewController(id: id, itemType: itemType)
    }

    func pagination(collectionView: HomeViewCollectionViews) {
        guard let itemType = self.presenter?.itemType else { return }
        switch itemType {
        case.movie:
            self.presenter?.getSimilarItemFromInteractor(page: (self.presenter?.similarMoviesPage ?? 1) + 1)
        case.tvShow:
            self.presenter?.getSimilarItemFromInteractor(page: (self.presenter?.similarTVShowsPage ?? 1) + 1)
        }
    }
}
