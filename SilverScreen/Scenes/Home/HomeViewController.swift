//  HomeViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 6.10.2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject, AlertViewPresenter {
    func updateCollectionViews(collectionView: HomeViewCollectionViews)
}

final class HomeViewController: UIViewController, HomeViewControllerProtocol {

    @IBOutlet private weak var segmentedControlView: SegmentedControllView!
    @IBOutlet private weak var popularCollectionView: ItemsCollectionView!
    @IBOutlet private weak var trendingCollectionView: ItemsCollectionView!
    @IBOutlet private weak var topRatedCollectionView: ItemsCollectionView!
    @IBOutlet private weak var upcomingCollectionView: ItemsCollectionView!
    @IBOutlet private weak var visiualEffect: UIVisualEffectView!
    @IBOutlet private weak var upcomingMoviesTitleAndSeeStackView: UIStackView!
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var headerImageShadowView: UIView!
    @IBOutlet private weak var headerItemLabel: UILabel!

    @IBOutlet private weak var giveAChanceTitleLabel: UILabel!
    @IBOutlet private weak var upcomingTitleLabel: UILabel!
    @IBOutlet private weak var topRatedTitleLabel: UILabel!
    @IBOutlet private weak var trendingTitleLabel: UILabel!
    @IBOutlet private weak var popularTitleLabel: UILabel!

    @IBOutlet private var seeAllItemsButtons: [UIButton]!

    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitles()
        self.getDatasFromPresenter()
        self.segmentedControlView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollToTop(collectionViews: [popularCollectionView, trendingCollectionView, topRatedCollectionView, upcomingCollectionView])
    }

    private func setupTitles() {
        self.giveAChanceTitleLabel.text = "homeVC.giveAChance.title".localized
        self.upcomingTitleLabel.text = "homeVC.upcoming.title".localized
        self.topRatedTitleLabel.text = "homeVC.topRated.title".localized
        self.trendingTitleLabel.text = "homeVC.trending.title".localized
        self.popularTitleLabel.text = "homeVC.popular.title".localized
        self.seeAllItemsButtons.forEach { button in
            button.setTitle("homeVC.seeAllItems.title".localized, for: .normal)
        }
    }

    private func getDatasFromPresenter() {
        presenter?.getPopularItemsFromInteractor(page: nil)
        presenter?.getTrendingItemsFromInteractor(page: nil)
        presenter?.getTopRatedItemsFromInteractor(page: nil)
        presenter?.getUpcomingItemsFromInteractor(page: nil)
    }

    private func hiddenUpcomingMovies(shouldHidden: Bool) {
        self.upcomingCollectionView.isHidden = shouldHidden
        self.upcomingMoviesTitleAndSeeStackView.isHidden = shouldHidden
    }

    private func setupHeaderImageView(itemType: ItemType) {
        self.headerImageView.setCornerRadius(cornerRadius: 10.0)
        self.headerImageShadowView.setShadow(shadowColor: UIColor.white.cgColor,
                                             shadowOffSet: CGSize(width: 1, height: 1),
                                             shadowOpacity: 0.3,
                                             shadowRadius: 10.0,
                                             clipsToBounds: true,
                                             masksToBounds: false)
        self.visiualEffect.setCornerRadiusForSpecificCorners(cornerRadius: 10.0, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], clipsToBounds: true)

        switch itemType {
        case .movie:
            guard let item = presenter?.selectedRandomMovieTrendItem else { return }
            self.headerImageView.setImage(path: item.backdrop_path ?? "")
            self.headerItemLabel.text = item.title
            self.headerImageViewGestureRecognizer(id: item.id?.description, itemType: .movie)
        case .tvShow:
            guard let item = presenter?.selectedRandomTVShowTrendItem else { return }
            self.headerImageView.setImage(path: item.backdrop_path ?? "")
            self.headerItemLabel.text = item.title
            self.headerImageViewGestureRecognizer(id: item.id?.description, itemType: .tvShow)
        }
    }

    private func headerImageViewGestureRecognizer(id: String?, itemType: ItemType?) {
        let tapGestureRecognizer = CustomGestureRecognizer(target: self, action: #selector(didTappedHeaderImage(sender:)))
        tapGestureRecognizer.itemId = id
        tapGestureRecognizer.itemType = itemType
        self.headerImageView.isUserInteractionEnabled = true
        self.headerImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func didTappedHeaderImage(sender: CustomGestureRecognizer) {
        self.presenter?.pushToDetailsViewController(id: sender.itemId ?? "", itemType: sender.itemType ?? .movie)
    }

    private func scrollToTop<T: ItemsCollectionView>(collectionViews: [T]) {
        collectionViews.forEach { collectionView in
            collectionView.scrollToTop()
        }
    }

    func updateCollectionViews(collectionView: HomeViewCollectionViews) {
        guard let itemType = presenter?.segmentedControllType else { return }
        switch collectionView {
        case .popularItemsCollectionView:
            switch itemType {
            case .movie:
                popularCollectionView.configureMovies(model: presenter?.popularMovies ?? [], collectionView: .popularItemsCollectionView)
                popularCollectionView.itemsCollectionViewDelegate = self
            case .tvShow:
                popularCollectionView.configureTVShows(model: presenter?.popularTVShows ?? [], collectionView: .popularItemsCollectionView)
                popularCollectionView.itemsCollectionViewDelegate = self
            }
        case .topRatedItemsCollectionView:
            switch itemType {
            case .movie:
                topRatedCollectionView.configureMovies(model: presenter?.topRatedMovies ?? [], collectionView: .topRatedItemsCollectionView)
                topRatedCollectionView.itemsCollectionViewDelegate = self
            case .tvShow:
                topRatedCollectionView.configureTVShows(model: presenter?.topRatedTVShows ?? [], collectionView: .topRatedItemsCollectionView)
                topRatedCollectionView.itemsCollectionViewDelegate = self
            }
        case .trendingItemsCollectionView:
            switch itemType {
            case .movie:
                trendingCollectionView.configureMovies(model: presenter?.trendingMovies ?? [], collectionView: .trendingItemsCollectionView)
                setupHeaderImageView(itemType: .movie)
                trendingCollectionView.itemsCollectionViewDelegate = self
            case .tvShow:
                trendingCollectionView.configureTVShows(model: presenter?.trendingTVShows ?? [], collectionView: .trendingItemsCollectionView)
                setupHeaderImageView(itemType: .tvShow)
                trendingCollectionView.itemsCollectionViewDelegate = self
            }
        case .upcomingMoviesCollectionView:
            upcomingCollectionView.configureMovies(model: presenter?.upcomingMovies ?? [], collectionView: .upcomingMoviesCollectionView)
            upcomingCollectionView.itemsCollectionViewDelegate = self
        }
    }

    @IBAction func seeAllPopularItemsButtonTapped(_ sender: Any) {
        self.presenter?.pushToSeeAllViewControllerPopularItems()
    }
    @IBAction func seeAllTrendingItems(_ sender: Any) {
        self.presenter?.pushToSeeAllViewControllerTrendingItems()
    }
    @IBAction func seeAllTopRatedItems(_ sender: Any) {
        self.presenter?.pushToSeeAllViewControllerTopRatedItems()
    }
    @IBAction func seeAllUpcomingItems(_ sender: Any) {
        self.presenter?.pushToSeeAllViewControllerUpcomingItems()
    }
}

extension HomeViewController: ItemsCollectionViewDelegate {
    func didTappedItem(id: String, itemType: ItemType) {
        presenter?.pushToDetailsViewController(id: id, itemType: itemType)
    }

    func pagination(collectionView: HomeViewCollectionViews) {
        guard let segmentedControllType = presenter?.segmentedControllType else { return }
        switch collectionView {
        case .popularItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getPopularItemsFromInteractor(page: (presenter?.popularMoviesPage ?? 1) + 1)
            case.tvShow:
                presenter?.getPopularItemsFromInteractor(page: (presenter?.popularTVShowsPage ?? 1) + 1)
            }
        case .topRatedItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getTopRatedItemsFromInteractor(page: (presenter?.topRatedMoviesPage ?? 1) + 1)
            case.tvShow:
                presenter?.getTopRatedItemsFromInteractor(page: (presenter?.topRatedTVShowsPage ?? 1) + 1)
            }
        case .trendingItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getTrendingItemsFromInteractor(page: (presenter?.trendingMoviesPage ?? 1) + 1)
            case.tvShow:
                presenter?.getTrendingItemsFromInteractor(page: (presenter?.trendingTVShowsPage ?? 1) + 1)
            }
        case .upcomingMoviesCollectionView:
            presenter?.getUpcomingItemsFromInteractor(page: (presenter?.upcomingMoviesPage ?? 1) + 1)
        }
    }
}

extension HomeViewController: SegmentedControlViewDelegate {
    func didTappedSegmentedControl(segmentedControlType: ItemType) {
        switch segmentedControlType {
        case .movie:
            presenter?.segmentedControllType = .movie
            self.getDatasFromPresenter()
            self.hiddenUpcomingMovies(shouldHidden: false)
        case .tvShow:
            presenter?.segmentedControllType = .tvShow
            self.getDatasFromPresenter()
            self.hiddenUpcomingMovies(shouldHidden: true)
        }
    }
}
