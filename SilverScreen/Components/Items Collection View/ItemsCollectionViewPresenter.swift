//
//  ItemsCollectionViewPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 29.12.2023.
//

import UIKit

protocol ItemCollectionViewPresenterProtocol {
    func getCellModel(at index: Int) -> Decodable?

    var movieModel: [MoviesItem]? { get set }
    var tvShowsModel: [TVShowsItem]? { get set }
    var itemType: ItemType? { get set }
    var collectionViewType: HomeViewCollectionViews? { get set }
    var numberOfItems: Int? { get }
}

final class ItemCollectionViewPresenter: ItemCollectionViewPresenterProtocol {
    var movieModel: [MoviesItem]?
    var tvShowsModel: [TVShowsItem]?
    var collectionViewType: HomeViewCollectionViews?

    var itemType: ItemType?

    var numberOfItems: Int? {
        guard let itemType = itemType else { return .zero }
        switch itemType {
        case.movie:
            return self.movieModel?.count
        case.tvShow:
            return self.tvShowsModel?.count
        }
    }

    func getCellModel(at index: Int) -> Decodable? {
        guard let itemType = itemType else { return nil }
        switch itemType {
        case .movie:
            return self.movieModel?[safe: index]
        case .tvShow:
            return self.tvShowsModel?[safe: index]
        }
    }
}
