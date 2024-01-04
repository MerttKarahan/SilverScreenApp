//
//  ItemsTableViewCell.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 14.11.2023.
//

import UIKit

final class ItemsTableViewCell: UITableViewCell {

    @IBOutlet private weak var reviewLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!

    override func prepareForReuse() {
        self.reviewLabel.text = nil
        self.authorLabel.text = nil
        self.ratingLabel.text = nil
    }

    func configure(model: ReviewItem) {
        self.authorLabel.text = model.author
        self.reviewLabel.text = "'\(model.content?.description ?? "")'"
        self.ratingLabel.text = model.author_details?.rating?.description ?? ""
        setupRatingLabelColor(ratingValue: model.author_details?.rating ?? .zero)
    }

    func setupRatingLabelColor(ratingValue: Float) {
        switch ratingValue {
        case 0..<5:
            self.ratingLabel.textColor = .red
        case 5..<8:
            self.ratingLabel.textColor = .yellow
        case 8...:
            self.ratingLabel.textColor = .green
        default:
            break
        }
    }
}
