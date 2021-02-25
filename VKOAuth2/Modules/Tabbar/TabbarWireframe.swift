//
// TabbarWireframe.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

final class TabbarWireframe: BaseWireframe {

    // MARK: - Private properties -
    private let subModules: Submodules
    // MARK: - Module setup -
    typealias Submodules = (
        friendsModule: FriendsWireframe, ()
    )
    
    init(subModules: Submodules) {
        self.subModules = subModules
        let moduleViewController = TabbarViewController()
        moduleViewController.viewControllers = [
            subModules.friendsModule.viewController
        ]
        super.init(viewController: moduleViewController)

        let interactor = TabbarInteractor()
        let presenter = TabbarPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension TabbarWireframe: TabbarWireframeInterface {
    
}
