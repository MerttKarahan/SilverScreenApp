//
//  SeeAllItemsViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 9.11.2023.
//

import UIKit

protocol SeeAllItemsViewControllerProtocol: AnyObject, AlertViewPresenter {
    func updateCollectionView(itemType: ItemType)
}

final class SeeAllItemsViewController: UIViewController, SeeAllItemsViewControllerProtocol {

    struct Constans {
        static let navigationControllerBackgroundColor: UIColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
    }

    @IBOutlet private weak var itemsCollectionView: ItemsCollectionView!

    var presenter: SeeAllItemsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupCollectionView()
    }

    func setupNavigationController() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_arrow_icon"), style: .plain, target: self, action: #selector(didTappedBackButton))
        self.navigationItem.leftBarButtonItem?.tintColor = .orange
        self.navigationItem.title = presenter?.setupNavigationBarTitle()
    }

    func updateCollectionView(itemType: ItemType) {
        switch itemType {
        case .movie:
            itemsCollectionView.configureMovies(model: presenter?.existItems as? [MoviesItem] ?? [], isScrollVertically: true)
        case .tvShow:
            itemsCollectionView.configureTVShows(model: presenter?.existItems as? [TVShowsItem] ?? [], isScrollVertically: true)
        }
    }

    @objc private func didTappedBackButton() {
        presenter?.goBackHomeViewController()
    }

    func setupCollectionView() {
        guard let itemType = presenter?.itemType else { return }
        switch itemType {
        case.movie:
            guard let movieModel = presenter?.existItems as? [MoviesItem] else { return }
            itemsCollectionView.configureMovies(model: movieModel, isScrollVertically: true)
            itemsCollectionView.itemsCollectionViewDelegate = self
        case.tvShow:
            guard let tvShowModel = presenter?.existItems as? [TVShowsItem] else { return }
            itemsCollectionView.configureTVShows(model: tvShowModel, isScrollVertically: true)
            itemsCollectionView.itemsCollectionViewDelegate = self
        }
    }
}

extension SeeAllItemsViewController: ItemsCollectionViewDelegate {
    func didTappedItem(id: String, itemType: ItemType) {
        self.presenter?.pushToDetailsViewController(id: id, itemType: itemType)
    }

    func pagination(collectionView: HomeViewCollectionViews) {
        guard let segmentedControllType = presenter?.itemType else { return }
        switch collectionView {
        case .popularItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getPopularItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            case.tvShow:
                presenter?.getPopularItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            }
        case .topRatedItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getTopRatedItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            case.tvShow:
                presenter?.getTopRatedItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            }
        case .trendingItemsCollectionView:
            switch segmentedControllType {
            case.movie:
                presenter?.getTrendingItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            case.tvShow:
                presenter?.getTrendingItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
            }
        case .upcomingMoviesCollectionView:
            presenter?.getUpcomingItemsFromInteractor(page: (presenter?.page ?? 1) + 1)
        }
    }
}
