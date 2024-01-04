//
//  VideoModel.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct VideosModel: Decodable {
    var results: [VideoItem]?
}

struct VideoItem: Decodable {
    var key: String?
}
