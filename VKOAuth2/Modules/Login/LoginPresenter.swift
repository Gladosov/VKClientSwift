//
// LoginPresenter.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

final class LoginPresenter {

    // MARK: - Private properties -

    private unowned let view: LoginViewInterface
    private let interactor: LoginInteractorInterface
    private let wireframe: LoginWireframeInterface

    // MARK: - Lifecycle -

    init(view: LoginViewInterface, interactor: LoginInteractorInterface, wireframe: LoginWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
    func tappedLogin() {
        self.wireframe.navigate(to: .web)
    }
}
