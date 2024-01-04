//
//  MovieDetailModel.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct MoviesDetailResult: Decodable {
    var title: String?
    var overview: String?
    var poster_path: String?
    var vote_average: Float?
    var vote_count: Int?
    var release_date: String?
    var original_language: String?
    var runtime: Int?
    var tagline: String?
    var genres: [MovieGenres]?
    var production_countries: [MovieProductionCountries]?
}

struct MovieGenres: Decodable {
    var id: Int?
    var name: String?
}

struct MovieProductionCountries: Decodable {
    var iso_3166_1: String?
    var name: String?
}
