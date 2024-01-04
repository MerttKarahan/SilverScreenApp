//
//  SegmentedControllView.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.11.2023.
//

import UIKit

protocol SegmentedControlViewDelegate: AnyObject {
    func didTappedSegmentedControl(segmentedControlType: ItemType)
}

final class SegmentedControllView: UIView {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var presenter: SegmentedControlPresenterProtocol? = SegmentedControlPresenter()
    weak var delegate: SegmentedControlViewDelegate?

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
        setupSegmentedControlTitles()
    }

    private func setupSegmentedControlTitles() {
        self.segmentedControl.setTitle("segmentedControl.movie.title".localized, forSegmentAt: 0)
        self.segmentedControl.setTitle("segmentedControl.tvShow.title".localized, forSegmentAt: 1)
    }

    @IBAction func segmentedControllTapped(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            presenter?.segmentedControlType = .movie
            self.delegate?.didTappedSegmentedControl(segmentedControlType: .movie)
        case 1:
            presenter?.segmentedControlType = .tvShow
            self.delegate?.didTappedSegmentedControl(segmentedControlType: .tvShow)
        default:
            break
        }
    }
}
