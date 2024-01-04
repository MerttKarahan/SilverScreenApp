//
//  PopularTVShows.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct TVShowsItem: Decodable, Equatable, ItemsProtocol {
    static func == (lhs: TVShowsItem, rhs: TVShowsItem) -> Bool {
        return lhs.id == rhs.id
    }

    var title: String?
    var poster_path: String?
    var backdrop_path: String?
    var release_date: String?
    var vote_average: Double?
    var vote_count: Int?
    var id: Int?
    var original_language: String?

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case poster_path = "poster_path"
        case backdrop_path = "backdrop_path"
        case release_date = "first_air_date"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case id = "id"
        case original_language = "original_language"
    }
}
