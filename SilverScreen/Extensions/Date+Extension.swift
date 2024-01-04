//
//  Date+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 7.12.2023.
//

import Foundation

extension Date {
    func convertToReadableDateStringg(responseDate: String, displayDate: String, value: String) -> String {
        let responseDateFormatter = DateFormatter()
        responseDateFormatter.dateFormat = responseDate
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = displayDate

        guard let date = responseDateFormatter.date(from: value) else { return "" }
        return displayDateFormatter.string(from: date)
    }
}
