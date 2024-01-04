//
//  ProfileRouter.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 18.10.2023.
//

import UIKit

typealias ProfileView = ProfileViewControllerProtocol & UIViewController

protocol ProfileRouterProtocol {
    func goBackLoginViewController()
}

final class ProfileRouter: ProfileRouterProtocol {
    var current: ProfileView?

    func goBackLoginViewController() {
        let loginViewController = LoginBuilder.build()

        current?.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
