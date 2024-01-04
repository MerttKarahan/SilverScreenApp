//
//  UIImageView+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(path: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + path)
        self.kf.setImage(with: url)
    }
}
