//
//  NoDataView.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 4.12.2023.
//

import UIKit

final class NoDataView: UIView {

    @IBOutlet private weak var noDataImage: UIImageView!
    @IBOutlet private weak var noDataLabel: UILabel!

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
        setupUI()
    }

    private func setupUI() {
        self.noDataImage.tintColor = .orange
    }

    func configureNoData(text: String?) {
        guard let text = text else { return }
        self.noDataLabel.text = text
    }
}
