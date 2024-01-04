//
//  TabBarViewController.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 17.10.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    struct Constants {
        static let tabBarBackgroundColor = UIColor(cgColor: .init(red: 52/255, green: 43/255, blue: 39/255, alpha: 1))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildTabBar()
        setTabBarUI()
    }

    private func buildTabBar() {
        let homeViewController = HomeBuilder.build()
        let searchViewController = SearchBuilder.build()
        let profileViewController = ProfileBuilder.build()
        let favoriteViewController = FavoritesBuilder.build()

        homeViewController.tabBarItem = UITabBarItem(title: "tabBar.home.title".localized, image: UIImage(named: "home_icon"), tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "tabBar.search.title".localized, image: UIImage(named: "search_icon"), tag: 1)
        favoriteViewController.tabBarItem = UITabBarItem(title: "tabBar.favorite.title".localized, image: UIImage(named: "favorite_icon"), tag: 2)
        profileViewController.tabBarItem = UITabBarItem(title: "tabBar.profile.title".localized, image: UIImage(named: "profile_icon"), tag: 3)

        self.setViewControllers([homeViewController, searchViewController, favoriteViewController, profileViewController], animated: true)
    }

    private func setTabBarUI() {
        self.tabBar.tintColor = .orange
        self.tabBar.standardAppearance.backgroundColor = Constants.tabBarBackgroundColor
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
    }
}
