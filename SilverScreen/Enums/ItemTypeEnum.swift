//
//  ItemTypeEnum.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import Foundation

enum ItemType {
    case movie
    case tvShow

    var typeName: String {
        switch self {
        case .movie:
            return "Movie"
        case .tvShow:
            return "TV Show"
        }
    }
}
