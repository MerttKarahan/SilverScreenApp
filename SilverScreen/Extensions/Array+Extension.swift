//
//  Array+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 26.10.2023.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
