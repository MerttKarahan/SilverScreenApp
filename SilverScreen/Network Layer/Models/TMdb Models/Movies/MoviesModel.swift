//
//  File.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct MoviesItem: Decodable, Equatable, ItemsProtocol {
    static func == (lhs: MoviesItem, rhs: MoviesItem) -> Bool {
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
    var genres: [Genres]?
}

struct Genres: Decodable {
    var id: Int?
    var name: String?
}
