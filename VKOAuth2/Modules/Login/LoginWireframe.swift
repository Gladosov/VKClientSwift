//
// LoginWireframe.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit


final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Login", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: LoginViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {
    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .home:
            let wireframe = TabbarWireframe(subModules: (
                FriendsWireframe(), ()
            ))
            navigationController?.setRootWireframe(wireframe)
        case .web:
            let wireframe = WebWireframe(didFinish: { [weak self] isSuccess in
                self?.navigate(to: .home)
            })
            
            navigationController?.present(wireframe.viewController, animated: true)
        }
    }
    
}
