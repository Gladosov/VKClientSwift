//
// WebWireframe.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

final class WebWireframe: BaseWireframe {

    // MARK: - Private properties -
    private var didFinish: (Bool) -> () = { _ in }
    // MARK: - Module setup -

    init(didFinish: @escaping (Bool) -> ()) {
        let moduleViewController = WebViewController()
        self.didFinish = didFinish
        super.init(viewController: moduleViewController)

        let interactor = WebInteractor()
        let presenter = WebPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension WebWireframe: WebWireframeInterface {
    func popBack(isSuccess: Bool) {
        self.didFinish(isSuccess)
        self.viewController.dismiss(animated: true)
    }
}
