//
//  ImageModel.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation

struct ImagesResult: Decodable {
    var backdrops: [ImageItem]?
}

struct ImageItem: Decodable {
    var file_path: String?
}
