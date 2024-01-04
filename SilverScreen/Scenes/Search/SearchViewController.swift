//
//  SearchViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject, AlertViewPresenter {
    func updateCollectionView()
}

final class SearchViewController: UIViewController, SearchViewControllerProtocol {

    var presenter: SearchPresenterProtocol?

    @IBOutlet private weak var activityIndicatorView: ActivityIndicatorView!
    @IBOutlet private weak var noDataStackView: UIStackView!
    @IBOutlet private weak var segmentedControlView: SegmentedControllView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var searchDescriptionLabel: UILabel!
    @IBOutlet private weak var collectionView: ItemsCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboard()
    }

    private func setupUI() {
        searchBar.delegate = self
        self.segmentedControlView.delegate = self
        self.collectionView.itemsCollectionViewDelegate = self
        self.setupTitles()
    }

    private func setupTitles() {
        self.searchBar.placeholder = "searchVC.searchBar.placeholder.text".localized
        self.searchDescriptionLabel.text = "searchVC.search.text".localized
    }

    private func shouldShowActivityIndicator(shouldShow: Bool) {
        if shouldShow {
            self.noDataStackView.isHidden = true
            self.activityIndicatorView.isHidden = !shouldShow
            self.activityIndicatorView.configure(title: .searchingDatas)
            self.activityIndicatorView.startActivity()
        } else {
            self.activityIndicatorView.isHidden = !shouldShow
            self.activityIndicatorView.stopActivity()
        }
    }

    func setupKeyboard() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneClick))
        toolBar.setItems([doneButton], animated: true)
        searchBar.inputAccessoryView = toolBar
    }

    @objc func doneClick() {
        view.endEditing(true)
    }

    func updateCollectionView() {
        self.shouldShowActivityIndicator(shouldShow: false)
        guard let itemType = self.presenter?.itemType else { return }
        switch itemType {
        case .movie:
            guard let searchedMovies = presenter?.searchedMovies else { return }
            self.noDataStackView.isHidden = searchedMovies.isEmpty ? false : true
            self.collectionView.configureMovies(model: searchedMovies, isScrollVertically: true)
        case .tvShow:
            guard let searchedTVShows = presenter?.searchedTVShows else { return }
            self.noDataStackView.isHidden = searchedTVShows.isEmpty ? false : true
            self.collectionView.configureTVShows(model: searchedTVShows, isScrollVertically: true)
        }
    }
}

extension SearchViewController: SegmentedControlViewDelegate {
    func didTappedSegmentedControl(segmentedControlType: ItemType) {
        self.presenter?.itemType = segmentedControlType
        if self.searchBar.text?.isEmpty == false {
            self.searchBar.text = nil
            self.presenter?.key = nil
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.shouldShowActivityIndicator(shouldShow: true)
        var timer: Timer?
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            self.presenter?.key = searchText
        })
    }
}

extension SearchViewController: ItemsCollectionViewDelegate {
    func pagination(collectionView: HomeViewCollectionViews) {
        guard let itemType = self.presenter?.itemType else { return }
        switch itemType {
        case.movie:
            self.presenter?.moviesPage += 1
        case.tvShow:
            self.presenter?.tvShowsPage += 1
        }
        self.presenter?.key = self.searchBar.text
    }

    func didTappedItem(id: String, itemType: ItemType) {
        self.presenter?.pushToDetailsViewController(id: id, itemType: itemType)
    }
}
