//
//  FavoritesViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 1.12.2023.
//

import UIKit

protocol FavoritesViewControllerProtocol: AnyObject, AlertViewPresenter {
    func reloadTableView()
    func didDeletedItem(message: String)
}

final class FavoritesViewController: UIViewController, FavoritesViewControllerProtocol {

    @IBOutlet private weak var noDataView: NoDataView!
    @IBOutlet private weak var segmentedControlView: SegmentedControllView!
    @IBOutlet private weak var favoritesItemTableView: UITableView!

    var presenter: FavoritesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.fetchFavoriteDatasFromInteractor()
    }

    private func setupView() {
        favoritesItemTableView.delegate = self
        favoritesItemTableView.dataSource = self
        favoritesItemTableView.register(nibWithCellClass: FirebaseItemsTableViewCell.self)
        self.segmentedControlView.delegate = self
    }

    private func shouldShowNoDataView() {
        if self.presenter?.numberOfItems  == .zero {
            self.noDataView.isHidden = false
            self.noDataView.configureNoData(text: "favoritesVC.noData.text".localized)
        } else {
            self.noDataView.isHidden = true
        }
    }

    func didDeletedItem(message: String) {
        self.shouldShowNoDataView()
        self.showAlert(message: message)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.shouldShowNoDataView()
            self.favoritesItemTableView.reloadData()
        }
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfItems ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = self.presenter?.getCellModel(at: indexPath.row) else { return UITableViewCell() }
        let cell = self.favoritesItemTableView.dequeueReusableCell(withClass: FirebaseItemsTableViewCell.self, for: indexPath)
        cell.delegate = self
        cell.configure(model: cellModel)
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let leftSwippedAction = UIContextualAction(style: .normal, title: "favoritesVC.swipped.text".localized) { _, _, completion in
            self.presenter?.willDeletedItem = self.presenter?.favoriteItems[indexPath.row]
            self.presenter?.favoriteItems.remove(at: indexPath.row)
            self.favoritesItemTableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        leftSwippedAction.backgroundColor = .black
        leftSwippedAction.image = UIImage(named: "trash_icon")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [leftSwippedAction])
        return swipeConfiguration
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let deletedItem = self.presenter?.favoriteItems[indexPath.row]
        self.presenter?.willDeletedItem = deletedItem
        self.presenter?.favoriteItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}

extension FavoritesViewController: SegmentedControlViewDelegate {
    func didTappedSegmentedControl(segmentedControlType: ItemType) {
        self.presenter?.itemType = segmentedControlType
    }
}

extension FavoritesViewController: FirebaseItemsTableViewCellDelegate {
    func pushDetailViewController(with id: String) {
        self.presenter?.pushToDetailViewController(id: id)
    }
}
