//
//  ItemsModel.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 25.10.2023.
//

import Foundation

protocol ItemsProtocol {
    var title: String? {get}
    var poster_path: String? {get}
    var release_date: String? {get}
    var vote_average: Double? {get}
    var vote_count: Int? {get}
    var id: Int? {get}
    var original_language: String? {get}
}

struct ItemsResult<T: Decodable>: Decodable {
    var page: Int?
    var results: [T]?
}
