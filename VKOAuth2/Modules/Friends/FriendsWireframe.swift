//
// FriendsWireframe.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

final class FriendsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Friends", bundle: nil)

    // MARK: - Module setup -

    init() {
        let navigationController = UINavigationController()
        let moduleViewController = storyboard.instantiateViewController(ofType: FriendsViewController.self)
        navigationController.setViewControllers([moduleViewController], animated: false)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.image = UIImage(systemName: "person.3.fill")
        navigationController.tabBarItem.title = "Друзья"
        super.init(viewController: navigationController)

        let interactor = FriendsInteractor()
        let presenter = FriendsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension FriendsWireframe: FriendsWireframeInterface {
}
