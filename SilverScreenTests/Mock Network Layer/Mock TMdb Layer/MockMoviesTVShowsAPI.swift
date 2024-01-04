//
//  MockMoviesTVShowsAPI.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen
import Foundation

final class MockMoviesTVShowsAPI: MoviesTVShowsAPIProtocol {
    
    var invokedGetMovies: Bool = false
    var invokedGetMoviesCount: Int = 0
    var getMoviesShouldReturnError: Bool = false
    func getMovies(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.MoviesItem>, NSError>) -> Void) {
        
        self.invokedGetMovies = true
        self.invokedGetMoviesCount += 1
        
        if getMoviesShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            let model = ItemsResult(page: 1, results: [MoviesItem(title: "", poster_path: "", backdrop_path: "", release_date: "", vote_average: 1, vote_count: 1, id: 1, original_language: "", genres: [])])
            completionHandler(.success(ItemsResult(page: 1, results: model.results)))
        }
    }
    
    var invokedGetTVShows: Bool = false
    var invokedGetTVShowsCount: Int = 0
    var getTVShowsShouldReturnError: Bool = false
    func getTVShows(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.TVShowsItem>, NSError>) -> Void) {
        self.invokedGetTVShows = true
        self.invokedGetTVShowsCount += 1
        if getTVShowsShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 2)))
        } else {
            let model = ItemsResult(page: 1, results: [TVShowsItem(title: "", poster_path: "", backdrop_path: "", release_date: "", vote_average: 1, vote_count: 1, id: 1, original_language: "")])
            completionHandler(.success(ItemsResult(page: 1, results: model.results)))
        }
    }
}
