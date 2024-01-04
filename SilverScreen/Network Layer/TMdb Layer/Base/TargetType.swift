//
//  TargetType.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation
import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

enum Task {
    case requestWithoutParams
    case requestWithParams(parameters: [String: Any], encoding: ParameterEncoding)
}

enum EndpointPaths: String {
    case popularMovies = "/movie/popular"
    case popularTVShows = "/tv/popular"
    case topRatedMovies = "/movie/top_rated"
    case topRatedTVShows = "/tv/top_rated"
    case upcomingMovies = "/movie/upcoming"
    case trendingMovies = "/trending/movie/week"
    case trendingTVShows = "/trending/tv/week"
    case movieDetails =  "/movie/%%"
    case tvShowDetails = "/tv/%%"
    case movieReviewers = "/movie/%%/reviews"
    case tvShowReviewers = "/tv/%%%"
    case similarMovies = "/movie/%%/similar"
    case similarTVShows = "/tv/%%/similar"
    case tvShowImages = "/tv/%%/images"
    case moviewImages = "/movie/%%/images"
    case tvShowVideos = "/tv/%%/videos"
    case movieVideos = "/movie/%%/videos"
    case getSearchForMovies = "/search/movie"
    case getSearchForTVShows = "/search/tv"
}
