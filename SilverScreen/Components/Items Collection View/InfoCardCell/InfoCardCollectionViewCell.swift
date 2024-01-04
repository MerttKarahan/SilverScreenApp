//
//  InfoCardCollectionViewCell.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

final class InfoCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var voteAvreageLabel: UILabel!
    @IBOutlet private weak var visiualEffectView: UIVisualEffectView!
    @IBOutlet private weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellUI()
    }

    private func setCellUI() {
        // corner radius
        self.visiualEffectView.setCornerRadiusForSpecificCorners(cornerRadius: 10, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        self.imageView.setCornerRadius(cornerRadius: 10)
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        // shadow
        self.setShadow(shadowColor: UIColor.white.cgColor, shadowOffSet: CGSize(width: 0.7, height: 0.7), shadowOpacity: 0.3, shadowRadius: 1)
    }

    /// Configure method for movie items
    func configureMovieCard(model: MoviesItem?) {
        self.imageView.setImage(path: model?.poster_path ?? "")
        self.titleLabel.text = model?.title
        self.dateLabel.text = model?.release_date?.convertToReadableDateString(responseDate: "yyyy-MM-dd", displayDate: "dd/MM/yyyy")
        self.voteAvreageLabel.text = "10/\(model?.vote_average?.description ?? "")"
    }

    /// Configure method for tv show items
    func configureTVShowCard(model: TVShowsItem?) {
        self.imageView.setImage(path: model?.poster_path ?? "")
        self.titleLabel.text = model?.title
        self.dateLabel.text = model?.release_date?.convertToReadableDateString(responseDate: "yyyy-MM-dd", displayDate: "dd/MM/yyyy")
        self.voteAvreageLabel.text = "10/\(model?.vote_average?.description ?? "")"
    }
}
