//
//  ActivityIndicatorEnums.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 16.11.2023.
//

import Foundation

enum ActivityIndicatorType {
    case searchingDatas
    case downloadingVideo

    var titleForIndicator: String {
        switch self {
        case .searchingDatas:
            return "activityIndicator.searchingDatas.text".localized
        case .downloadingVideo:
            return "activityIndicator.downloadingVideo.text".localized
        }
    }
}
