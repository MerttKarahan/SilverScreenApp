//
//  ReviewModel.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 14.11.2023.
//

import Foundation

struct ReviewersResult: Decodable {
    var page: Int?
    var results: [ReviewItem]?
}

struct ReviewItem: Decodable {
    var author: String?
    var content: String?
    var created_at: String?
    var author_details: AuthorDetails?
}

struct AuthorDetails: Decodable {
    var rating: Float?
}
