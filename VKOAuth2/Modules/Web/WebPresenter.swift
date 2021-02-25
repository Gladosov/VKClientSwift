//
// WebPresenter.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation
import WebKit

final class WebPresenter {

    // MARK: - Private properties -

    private unowned let view: WebViewInterface
    private let interactor: WebInteractorInterface
    private let wireframe: WebWireframeInterface

    // MARK: - Lifecycle -

    init(view: WebViewInterface, interactor: WebInteractorInterface, wireframe: WebWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe

        self.loadURL(using: interactor.authPageURL)
    }
}

// MARK: - Extensions -

extension WebPresenter: WebPresenterInterface {
    func loadURL(using string: String) {
        guard let url = URL(string: string) else { return }
        view.loadURL(url)
    }
    
    func didFinishLoadWebPage(with url: URL?) {
        guard let url = url else { return }
        guard let urlHost = url.host else { return }
        guard let redirectHost = URL(string: interactor.authRedirectURL)?.host else { return }
        
        if urlHost == redirectHost {
            interactor.login(url: url) { [weak self] (isSuccess) in
                self?.wireframe.popBack(isSuccess: isSuccess)
            }
        }
    }
}
