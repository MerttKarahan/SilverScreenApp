//
//  MoviesTVShowsNetworking.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation
import Alamofire

enum MoviesTVShowsNetworking {
    case getPopularMovies(page: Int)
    case getPopularTVShows(page: Int)
    case getTopRatedMovies(page: Int)
    case getTopRatedTVShows(page: Int)
    case getTrendingMovies(page: Int)
    case getTrendingTVShows(page: Int)
    case getMovieDetails(id: String)
    case getTvShowDetails(id: String)
    case getMovieReviewers(page: Int, id: String)
    case getTvShowReviewers(page: Int, id: String)
    case getSimilarMovies(page: Int, id: String)
    case getSimilarTVShows(page: Int, id: String)
    // PAGE EKLEDİM
    case getUpcomingMovies(page: Int)
    case getMovieImages(id: String)
    case getMovieVideos(id: String)
    case getTVShowImages(id: String)
    case getTVShowVideos(id: String)
    case getSearchMovies(page: Int, key: String)
    case getSearchTVShow(page: Int, key: String)
}

extension MoviesTVShowsNetworking: TargetType {

    var baseURL: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }

    var path: String {
        switch self {
        case .getPopularMovies:
            return EndpointPaths.popularMovies.rawValue
        case .getPopularTVShows:
            return EndpointPaths.popularTVShows.rawValue
        case .getTopRatedMovies:
            return EndpointPaths.topRatedMovies.rawValue
        case .getTopRatedTVShows:
            return EndpointPaths.topRatedTVShows.rawValue
        case .getTrendingMovies:
            return EndpointPaths.trendingMovies.rawValue
        case .getTrendingTVShows:
            return EndpointPaths.trendingTVShows.rawValue
        case .getMovieDetails(let id):
            return EndpointPaths.movieDetails.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getTvShowDetails(let id):
            return EndpointPaths.tvShowDetails.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getMovieReviewers(_, let id):
            return EndpointPaths.movieReviewers.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getTvShowReviewers(_, let id):
            return EndpointPaths.tvShowReviewers.rawValue.replacingOccurrences(of: "%%%", with: id)
        case .getSimilarMovies(_, let id):
            return EndpointPaths.similarMovies.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getSimilarTVShows(_, let id):
            return EndpointPaths.similarTVShows.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getUpcomingMovies:
            return EndpointPaths.upcomingMovies.rawValue
        case .getMovieImages(let id):
            return EndpointPaths.moviewImages.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getMovieVideos(let id):
            return EndpointPaths.movieVideos.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getTVShowImages(let id):
            return EndpointPaths.tvShowImages.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getTVShowVideos(let id):
            return EndpointPaths.tvShowVideos.rawValue.replacingOccurrences(of: "%%", with: id)
        case .getSearchMovies:
            return EndpointPaths.getSearchForMovies.rawValue
        case .getSearchTVShow:
            return EndpointPaths.getSearchForTVShows.rawValue
        }
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getPopularMovies(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getPopularTVShows(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getTopRatedMovies(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getTopRatedTVShows(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getTrendingMovies(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getTrendingTVShows(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getMovieReviewers(let page, _):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getTvShowReviewers(let page, _):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getSimilarMovies(let page, _):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getSimilarTVShows(let page, _):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
            // CASE EKLEDİM
        case .getUpcomingMovies(let page):
            return .requestWithParams(parameters: ["page": page], encoding: URLEncoding.default)
        case .getSearchMovies(let page, let key):
            return .requestWithParams(parameters: ["page": page, "query": key], encoding: URLEncoding.default)
        case .getSearchTVShow(let page, let key):
            return .requestWithParams(parameters: ["page": page, "query": key], encoding: URLEncoding.default)
        default:
            return .requestWithoutParams
        }
    }

    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }
}
