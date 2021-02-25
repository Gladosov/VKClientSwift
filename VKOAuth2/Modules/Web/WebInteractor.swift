//
// WebInteractor.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

final class WebInteractor {
    private let userSettings = UserSettings.shared
}

// MARK: - Extensions -

extension WebInteractor: WebInteractorInterface {
    var authPageURL: String {
        "https://oauth.vk.com/authorize?client_id=7469071&redirect_uri=https://google.com&display=mobile&response_type=token&scope=8194&revoke=1"
    }
    
    var authRedirectURL: String {
        "https://www.google.com"
    }
    
    func login(url: URL, completion: @escaping (Bool) -> ()) {
        let urlString = url.absoluteString.replacingOccurrences(of: "#", with: "?")
        guard let urlComponents = URLComponents(string: urlString),
            let queryItems = urlComponents.queryItems,
            let accessToken = queryItems.filter({
                $0.name == "access_token"
            }).first?.value,
            let expiresString = queryItems.filter({
                $0.name == "expires_in"
            }).first?.value,
            let userIDString = queryItems.filter({
                $0.name == "user_id"
            }).first?.value,
            let expiresInterval = Double(expiresString),
            let userID = Int(userIDString)
            else {
                completion(false)
                return
        }
        let expiresIn = Date(timeIntervalSinceNow: expiresInterval)
        
        userSettings.saveToken(accessToken: accessToken, expiresDate: expiresIn, userId: userID)
        
        completion(true)
    }
}
