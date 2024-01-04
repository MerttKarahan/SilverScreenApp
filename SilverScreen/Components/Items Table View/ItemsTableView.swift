//
//  ItemsTableView.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 14.11.2023.
//

import UIKit

protocol ItemsTableViewDelegate: AnyObject {
    func pagination()
}

final class ItemsTableView: UIView {

    @IBOutlet weak var tableView: UITableView!

    private var presenter: ItemsTableViewPresenterProtocol = ItemsTableViewPresenter()

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
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibWithCellClass: ItemsTableViewCell.self)
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func configure(model: [ReviewItem]) {
        self.presenter.items = model
        self.reloadTableView()
    }
}

extension ItemsTableView: UITableViewDelegate {

}

extension ItemsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = self.presenter.getCellModel(at: indexPath.row) else { return UITableViewCell() }
        let cell = self.tableView.dequeueReusableCell(withClass: ItemsTableViewCell.self, for: indexPath)
        cell.configure(model: cellModel)
        return cell
    }
}
