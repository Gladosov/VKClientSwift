//
// WebInterfaces.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

protocol WebWireframeInterface: WireframeInterface {
    func popBack(isSuccess: Bool)
}

protocol WebViewInterface: ViewInterface {
    func loadURL(_ url: URL)
}

protocol WebPresenterInterface: PresenterInterface {
    func loadURL(using string: String)
    func didFinishLoadWebPage(with url: URL?)
}

protocol WebInteractorInterface: InteractorInterface {
    var authPageURL: String { get }
    var authRedirectURL: String { get }
    
    
    /// Checks a url to find login data
    /// - Parameters:
    ///   - url: url to check
    ///   - completion: Returns whether there are Data in the link or not
    func login(url: URL, completion: @escaping (Bool) -> ())
}
