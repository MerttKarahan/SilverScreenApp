//
//  HomeViewEnums.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 10.11.2023.
//

import Foundation

enum HomeViewMoviesEndpoints {
    case getPopularMovies
    case getTopRatedMovies
    case getTrendingMovies
    case getUpcomingMovies
}

enum HomeViewTVShowsEndpoints {
    case getPopularTVShows
    case getTopRatedTVShows
    case getTrendingTVShows
}

enum HomeViewCollectionViews {
    case popularItemsCollectionView
    case topRatedItemsCollectionView
    case trendingItemsCollectionView
    case upcomingMoviesCollectionView

    func collectionViewsTitle(itemType: ItemType?) -> String {
        var title: String = ""
        switch self {
        case .popularItemsCollectionView:
            title = itemType == .movie ? "seeAllItems.navigationBar.popular.movies.title".localized : "seeAllItems.navigationBar.popular.tvShows.title".localized
        case .topRatedItemsCollectionView:
            title = itemType == .movie ? "seeAllItems.navigationBar.topRated.movies.title".localized : "seeAllItems.navigationBar.topRated.tvShow.title".localized
        case .trendingItemsCollectionView:
            title = itemType == .movie ? "seeAllItems.navigationBar.trending.movies.title".localized : "seeAllItems.navigationBar.trending.tvShows.title".localized
        case .upcomingMoviesCollectionView:
            title = "seeAllItems.navigationBar.upcoming.movies.title".localized
        }
        return title
    }
}
