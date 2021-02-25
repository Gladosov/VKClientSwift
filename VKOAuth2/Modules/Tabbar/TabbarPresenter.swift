//
// TabbarPresenter.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

final class TabbarPresenter {

    // MARK: - Private properties -

    private unowned let view: TabbarViewInterface
    private let interactor: TabbarInteractorInterface
    private let wireframe: TabbarWireframeInterface

    // MARK: - Lifecycle -

    init(view: TabbarViewInterface, interactor: TabbarInteractorInterface, wireframe: TabbarWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension TabbarPresenter: TabbarPresenterInterface {
}
