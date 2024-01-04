//
//  ItemsTableViewPresenter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 14.11.2023.
//

import Foundation

protocol ItemsTableViewPresenterProtocol {
    var items: [ReviewItem]? { get set }
    var numberOfItems: Int { get }
    func getCellModel(at index: Int) -> ReviewItem?
}

final class ItemsTableViewPresenter: ItemsTableViewPresenterProtocol {
    var items: [ReviewItem]?

    var numberOfItems: Int {
        guard let items = items else { return .zero}
        return items.count
    }

    func getCellModel(at index: Int) -> ReviewItem? {
        guard let items = items else { return nil }
        return items[safe: index]
    }
}
