//
// SceneDelegate.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.isHidden = true
        rootViewController.setRootWireframe(LoginWireframe())
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

