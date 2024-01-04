//
//  FirebaseItemsTableViewCell.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 27.11.2023.
//

import UIKit

protocol FirebaseItemsTableViewCellDelegate: AnyObject {
    func pushDetailViewController(with id: String)
}

final class FirebaseItemsTableViewCell: UITableViewCell {

    @IBOutlet private weak var holderView: UIView!
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var pushDetailButton: UIButton!

    private var id: String?

    weak var delegate: FirebaseItemsTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    private func setupUI() {
        self.contentView.setShadow(shadowColor: UIColor.white.cgColor,
                                   shadowOffSet: CGSize(width: 0.2, height: 0.2),
                                  shadowOpacity: 0.1,
                                  shadowRadius: 10.0,
                                  clipsToBounds: true,
                                  masksToBounds: false)
        self.itemImage.setCornerRadius(cornerRadius: 10.0)
        self.holderView.setCornerRadius(cornerRadius: 10.0)
        self.pushDetailButton.tintColor = UIColor.orange
    }

    func configure(model: FavoritesModel) {
        self.id = model.itemId
        self.itemImage.setImage(path: model.imageURL)
        self.itemLabel.text = model.title
    }

    @IBAction func pushDetailButtonTapped(_ sender: Any) {
        guard let id = self.id else { return }
        delegate?.pushDetailViewController(with: id)
    }
}
