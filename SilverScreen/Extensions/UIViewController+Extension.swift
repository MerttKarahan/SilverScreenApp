//
//  UIViewController+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

extension UIViewController {
    static var className: String {
        return String(describing: self)
    }
}
