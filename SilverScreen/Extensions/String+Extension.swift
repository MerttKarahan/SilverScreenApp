//
//  String+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 5.12.2023.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    func convertToReadableDateString(responseDate: String, displayDate: String) -> String {
        let responseDateFormatter = DateFormatter()
        responseDateFormatter.dateFormat = responseDate
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = displayDate

        guard let date = responseDateFormatter.date(from: self) else { return "" }
        return displayDateFormatter.string(from: date)
    }
}
