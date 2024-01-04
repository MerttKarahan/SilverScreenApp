//
//  MockMoviesTVShowsSearchedAPI.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen
import Foundation

final class MockMoviesTVShowsSearchedAPI: MoviesTVShowsSearchedProtocol {
    var invokedGetSearchedMovies: Bool = false
    var invokedGetSearchedMoviesCount: Int = 0
    var getSearchedMoviesShouldReturnError: Bool = false
    func getSearchedMovies(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.MoviesItem>, NSError>) -> Void) {
        self.invokedGetSearchedMovies = true
        self.invokedGetSearchedMoviesCount += 1
        if getSearchedMoviesShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            let model = ItemsResult(page: 1, results: [MoviesItem(title: "", poster_path: "", backdrop_path: "", release_date: "", vote_average: 1, vote_count: 1, id: 1, original_language: "", genres: [])])
            completionHandler(.success(ItemsResult(page: 1, results: model.results)))
        }
    }
    
    var invokedGetSearchedTVShow: Bool = false
    var invokedGetSearchedTVShowCount: Int = 0
    var getSearchedTVShowShouldReturnError: Bool = false
    func getSearchedTVShows(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.TVShowsItem>, NSError>) -> Void) {
        self.invokedGetSearchedTVShow = true
        self.invokedGetSearchedTVShowCount += 1
        if getSearchedTVShowShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            let model = ItemsResult(page: 1, results: [TVShowsItem(title: "", poster_path: "", backdrop_path: "", release_date: "", vote_average: 1, vote_count: 1, id: 1, original_language: "")])
            completionHandler(.success(ItemsResult(page: 1, results: model.results)))
        }
    }
}
