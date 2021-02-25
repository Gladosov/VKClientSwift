//
// LoginInterfaces.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

enum LoginNavigationOption {
    case home
    case web
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
}

protocol LoginPresenterInterface: PresenterInterface {
    func tappedLogin()
}

protocol LoginInteractorInterface: InteractorInterface {
}
