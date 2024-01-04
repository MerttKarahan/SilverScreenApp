//
//  UIView+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 25.10.2023.
//

import UIKit

extension UIView {
    /// Load view from related nib.
    /// - Parameter autoResizingMask: set view's autoResizingMask value if needed
    /// - Returns: return T
    func nibInstantiate(autoResizingMask: UIView.AutoresizingMask = []) -> UIView {
        let bundle = Bundle(for: Self.self)
        let nib = bundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        let view = nib?.first as? UIView
        guard let view = view else {return UIView()}
        view.autoresizingMask = autoResizingMask
        return view
    }

    func setCornerRadius(cornerRadius: CGFloat, clipsToBounds: Bool = false, masksToBounds: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
        self.layer.masksToBounds = masksToBounds
    }

    func setCornerRadiusForSpecificCorners(cornerRadius: CGFloat, corners: CACornerMask, clipsToBounds: Bool = false, masksToBounds: Bool = true) {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
        self.layer.masksToBounds = masksToBounds
    }

    func setBorder(borderWidth: CGFloat, borderColor: CGColor) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }

    func setShadow(shadowColor: CGColor, shadowOffSet: CGSize, shadowOpacity: Float, shadowRadius: CGFloat, clipsToBounds: Bool = false, masksToBounds: Bool = true) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffSet
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.clipsToBounds = clipsToBounds
        self.layer.masksToBounds = masksToBounds
    }
}
