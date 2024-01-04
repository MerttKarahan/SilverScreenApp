//
//  ItemsCollectionView.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 25.10.2023.
//

import UIKit

protocol ItemsCollectionViewDelegate: AnyObject {
    func pagination(collectionView: HomeViewCollectionViews)
    func didTappedItem(id: String, itemType: ItemType)
}

final class ItemsCollectionView: UIView {

    struct Constants {
        static let cellHeight: CGFloat = 200.0
    }

    @IBOutlet private weak var itemsCollectionView: UICollectionView!

    private var presenter: ItemCollectionViewPresenterProtocol? = ItemCollectionViewPresenter()
    weak var itemsCollectionViewDelegate: ItemsCollectionViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleWidth, .flexibleHeight])
        view.frame = self.bounds
        addSubview(view)
        setupCollectionView()
    }

    private func setupCollectionView() {
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.register(nibWithCellClass: InfoCardCollectionViewCell.self)
    }

    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.itemsCollectionView.reloadData()
        }
    }

    func scrollToTop() {
        self.itemsCollectionView.scrollToTop()
    }

    /// Configure method for MoviesItems
    /// - Parameters:
    ///   - model: MoviesItem array.
    func configureMovies(model: [MoviesItem], collectionView: HomeViewCollectionViews? = nil, isScrollVertically: Bool? = false) {
        if let isScrollVertically = isScrollVertically {
            itemsCollectionView.changeScrollDirectionOfCollectionViewToVertically(isScrollVertically: isScrollVertically)
        }
        presenter?.movieModel = model
        presenter?.collectionViewType = collectionView
        presenter?.itemType = .movie
        self.reloadCollectionView()
    }

    /// Configure method for TVShowsItems
    /// - Parameters:
    ///   - model: TVShowsItem array.
    func configureTVShows(model: [TVShowsItem], collectionView: HomeViewCollectionViews? = nil, isScrollVertically: Bool? = false) {
        if let isScrollVertically = isScrollVertically {
            itemsCollectionView.changeScrollDirectionOfCollectionViewToVertically(isScrollVertically: isScrollVertically)
        }
        presenter?.tvShowsModel = model
        presenter?.collectionViewType = collectionView
        presenter?.itemType = .tvShow
        self.reloadCollectionView()
    }
}

extension ItemsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let numberOfItems: Int = presenter?.numberOfItems else { return }
        if indexPath.row == (numberOfItems) - 1 {
            itemsCollectionViewDelegate?.pagination(collectionView: presenter?.collectionViewType ?? .popularItemsCollectionView)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = presenter?.getCellModel(at: indexPath.row), let itemType = presenter?.itemType else { return }
        switch itemType {
        case .movie:
            guard let movieId = (item as? MoviesItem)?.id?.description else { return }
            itemsCollectionViewDelegate?.didTappedItem(id: movieId, itemType: itemType)
        case .tvShow:
            guard let tvShowId = (item as? TVShowsItem)?.id?.description else { return }
            itemsCollectionViewDelegate?.didTappedItem(id: tvShowId, itemType: itemType)
        }
    }
}

extension ItemsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellModel = presenter?.getCellModel(at: indexPath.row), let itemType = presenter?.itemType  else { return UICollectionViewCell()}
        let cell = itemsCollectionView.dequeueReusableCell(withClass: InfoCardCollectionViewCell.self, for: indexPath)
        switch itemType {
        case.movie:
            cell.configureMovieCard(model: cellModel as? MoviesItem)
        case.tvShow:
            cell.configureTVShowCard(model: cellModel as? TVShowsItem)
        }
        return cell
    }

}

extension ItemsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = itemsCollectionView.isScrollVertically ? (itemsCollectionView.bounds.width) / 3.1 : (itemsCollectionView.bounds.width - 10) / 2.8
        return CGSize(width: cellWidth, height: Constants.cellHeight)
    }
}
