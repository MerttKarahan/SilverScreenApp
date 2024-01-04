//
//  ActivityIndicatorView.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 16.11.2023.
//

import UIKit

final class ActivityIndicatorView: UIView {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var warningLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleWidth, .flexibleHeight])
        view.frame = self.bounds
        addSubview(view)
    }

    func configure(title: ActivityIndicatorType) {
        self.warningLabel.text = title.titleForIndicator
    }

    func startActivity() {
        self.activityIndicator.startAnimating()
    }

    func stopActivity() {
        self.activityIndicator.stopAnimating()
    }
}
