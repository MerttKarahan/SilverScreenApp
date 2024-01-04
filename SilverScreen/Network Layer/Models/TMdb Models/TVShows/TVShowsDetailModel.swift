//
//  TopRatedTVShows.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct TVShowsDetailResult: Decodable {
    var name: String?
    var overview: String?
    var poster_path: String?
    var vote_average: Float?
    var vote_count: Int?
    var first_air_date: String?
    var number_of_seasons: Int?
    var number_of_episodes: Int?
    var original_language: String?
    var tagline: String?
    var genres: [TVShowGenres]?
    var production_countries: [TVShowProductionCountries]?
}

struct TVShowGenres: Decodable {
    var id: Int?
    var name: String?
}

struct TVShowProductionCountries: Decodable {
    var iso_3166_1: String?
    var name: String?
}
