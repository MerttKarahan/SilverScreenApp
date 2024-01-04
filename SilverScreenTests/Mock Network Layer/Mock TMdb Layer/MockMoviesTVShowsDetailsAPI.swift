//
//  MockMoviesTVShowsDetailsAPI.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 26.12.2023.
//

@testable import SilverScreen
import Foundation

final class MockMoviesTVShowsDetailsAPI: MoviesTVShowsDetailsProtocol {
    
    var invokedGetTvShowDetails: Bool = false
    var invokedGetTvShowDetailsCount: Int = 0
    var getTvShowDetailsShouldReturnError: Bool = false
    func getTvShowDetails(id: String, completionHandler: @escaping (Result<SilverScreen.TVShowsDetailResult, NSError>) -> Void) {
        self.invokedGetTvShowDetails = true
        self.invokedGetTvShowDetailsCount += 1
        if getTvShowDetailsShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(TVShowsDetailResult()))
        }
    }
    
    var invokedGetMovieDetails: Bool = false
    var invokedGetMovieDetailsCount: Int = 0
    var getMovieDetailsShouldReturnError: Bool = false
    func getMovieDetails(id: String, completionHandler: @escaping (Result<SilverScreen.MoviesDetailResult, NSError>) -> Void) {
        self.invokedGetMovieDetails = true
        self.invokedGetMovieDetailsCount += 1
        if getMovieDetailsShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(MoviesDetailResult()))
        }
    }
    
    var invokedGetImages: Bool = false
    var invokedGetImagesCount: Int = 0
    var getImagesShouldReturnError: Bool = false
    func getImages(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ImagesResult, NSError>) -> Void) {
        self.invokedGetImages = true
        self.invokedGetImagesCount += 1
        if getImagesShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(ImagesResult()))
        }
    }
    
    var invokedGetVideos: Bool = false
    var invokedGetVideosCount: Int = 0
    var getVideosShouldReturnError: Bool = false
    func getVideos(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.VideosModel, NSError>) -> Void) {
        self.invokedGetVideos = true
        self.invokedGetVideosCount += 1
        if getVideosShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(VideosModel()))
        }
    }
    
    var invokedGetSimilarMovies: Bool = false
    var invokedGetSimilarMoviesCount: Int = 0
    var getSimilarMoviesShouldReturnError: Bool = false
    func getSimilarMovies(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.MoviesItem>, NSError>) -> Void) {
        self.invokedGetSimilarMovies = true
        self.invokedGetSimilarMoviesCount += 1
        if getSimilarMoviesShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(ItemsResult(page: nil, results: [])))
        }
    }
    
    var invokedGetSimilarTVShows: Bool = false
    var invokedGetSimilarTVShowsCount: Int = 0
    var getSimilarTVShowShouldReturnError: Bool = false
    func getSimilarTVShows(target: SilverScreen.TargetType, completionHandler: @escaping (Result<SilverScreen.ItemsResult<SilverScreen.TVShowsItem>, NSError>) -> Void) {
        self.invokedGetSimilarTVShows = true
        self.invokedGetSimilarTVShowsCount += 1
        if getSimilarTVShowShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(ItemsResult(page: nil, results: [])))
        }
    }
    
    var invokedGetMovieReviewers: Bool = false
    var invokedGetMovieReviewersCount: Int = 0
    var getMovieReviewersShouldReturnError: Bool = false
    func getMovieReviewers(id: String, page: Int, completionHandler: @escaping (Result<SilverScreen.ReviewersResult, NSError>) -> Void) {
        self.invokedGetMovieReviewers = true
        self.invokedGetMovieReviewersCount += 1
        if getMovieReviewersShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(ReviewersResult()))
        }
    }
    
    var invokedGetTvShowReviewers: Bool = false
    var invokedGetTvShowReviewersCount: Int = 0
    var getTvShowReviewersShouldReturnError: Bool = false
    func getTvShowReviewers(id: String, page: Int, completionHandler: @escaping (Result<SilverScreen.ReviewersResult, NSError>) -> Void) {
        self.invokedGetTvShowReviewers = true
        self.invokedGetTvShowReviewersCount += 1
        if getTvShowReviewersShouldReturnError {
            completionHandler(.failure(NSError(domain: "", code: 1)))
        } else {
            completionHandler(.success(ReviewersResult()))
        }
    }
}
