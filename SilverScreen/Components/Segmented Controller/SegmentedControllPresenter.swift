//
//  SegmentedControllPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.11.2023.
//

import Foundation

protocol SegmentedControlPresenterProtocol {
    var segmentedControlType: ItemType? { get set }
}

final class SegmentedControlPresenter: SegmentedControlPresenterProtocol {

    var segmentedControlType: ItemType? = .movie
}
