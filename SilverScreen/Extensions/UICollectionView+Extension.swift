//
//  UICollectionView+Extension.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 25.10.2023.
//

import UIKit

extension UICollectionView {

    var isScrollVertically: Bool {
        let layout = self.collectionViewLayout as? UICollectionViewFlowLayout
        return layout?.scrollDirection == .vertical
    }

    func scrollToTop() {
        self.setContentOffset(CGPoint.zero, animated: true)
    }

    func register<T: UICollectionViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }

    func changeScrollDirectionOfCollectionViewToVertically(isScrollVertically: Bool) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = isScrollVertically ? .vertical : .horizontal
        }
    }
}
