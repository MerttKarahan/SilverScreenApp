//
//  MovieTVShowsAPI.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation
import Alamofire

protocol MoviesTVShowsDetailsProtocol {
    func getTvShowDetails(id: String, completionHandler: @escaping (Result<TVShowsDetailResult, NSError>) -> Void)
    func getMovieDetails(id: String, completionHandler: @escaping (Result<MoviesDetailResult, NSError>) -> Void)
    func getImages(target: TargetType, completionHandler: @escaping (Result<ImagesResult, NSError>) -> Void)
    func getVideos(target: TargetType, completionHandler: @escaping (Result<VideosModel, NSError>) -> Void)
    func getSimilarMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void)
    func getSimilarTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void)
    func getMovieReviewers(id: String, page: Int, completionHandler: @escaping (Result<ReviewersResult, NSError>) -> Void)
    func getTvShowReviewers(id: String, page: Int, completionHandler: @escaping (Result<ReviewersResult, NSError>) -> Void)
}

protocol MoviesTVShowsAPIProtocol {
    func getMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void)
    func getTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void)
}

protocol MoviesTVShowsSearchedProtocol {
    func getSearchedMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void)
    func getSearchedTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void)
}

class MoviesTVShowsAPI: BaseAPI, MoviesTVShowsAPIProtocol, MoviesTVShowsDetailsProtocol, MoviesTVShowsSearchedProtocol {
    func getImages(target: TargetType, completionHandler: @escaping (Result<ImagesResult, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getVideos(target: TargetType, completionHandler: @escaping (Result<VideosModel, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getMovieDetails(id: String, completionHandler: @escaping (Result<MoviesDetailResult, NSError>) -> Void) {
        self.fetchData(target: MoviesTVShowsNetworking.getMovieDetails(id: id), completionHandler: completionHandler)
    }

    func getTvShowDetails(id: String, completionHandler: @escaping (Result<TVShowsDetailResult, NSError>) -> Void) {
        self.fetchData(target: MoviesTVShowsNetworking.getTvShowDetails(id: id), completionHandler: completionHandler)
    }

    func getMovieReviewers(id: String, page: Int, completionHandler: @escaping (Result<ReviewersResult, NSError>) -> Void) {
        self.fetchData(target: MoviesTVShowsNetworking.getMovieReviewers(page: page, id: id), completionHandler: completionHandler)
    }

    func getTvShowReviewers(id: String, page: Int, completionHandler: @escaping (Result<ReviewersResult, NSError>) -> Void) {
        self.fetchData(target: MoviesTVShowsNetworking.getTvShowReviewers(page: page, id: id), completionHandler: completionHandler)
    }

    func getUpcomingMovies(page: Int, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void) {
        self.fetchData(target: MoviesTVShowsNetworking.getUpcomingMovies(page: page), completionHandler: completionHandler)
    }

    func getSimilarMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getSimilarTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getSearchedMovies(target: TargetType, completionHandler: @escaping (Result<ItemsResult<MoviesItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }

    func getSearchedTVShows(target: TargetType, completionHandler: @escaping (Result<ItemsResult<TVShowsItem>, NSError>) -> Void) {
        self.fetchData(target: target, completionHandler: completionHandler)
    }
}
