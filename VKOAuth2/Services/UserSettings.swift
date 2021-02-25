//
// UserSettings.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

class UserSettings {
    
    static let shared: UserSettings = UserSettings()
    
    private init() {}
    
    private let ACCESS_TOKEN = "ACCESS_TOKEN"
    private let EXPIRES_DATE = "EXPIRES_DATE"
    private let USER_ID = "USER_ID"
    
    var accessToken: String {
        UserDefaults.standard.string(forKey: ACCESS_TOKEN) ?? ""
    }
    
    var userId: Int {
        UserDefaults.standard.integer(forKey: USER_ID)
    }
    
    func saveToken(accessToken: String, expiresDate: Date, userId: Int) {
        UserDefaults.standard.set(accessToken, forKey: ACCESS_TOKEN)
        UserDefaults.standard.set(expiresDate, forKey: EXPIRES_DATE)
        UserDefaults.standard.set(userId, forKey: USER_ID)
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: ACCESS_TOKEN)
        UserDefaults.standard.removeObject(forKey: EXPIRES_DATE)
        UserDefaults.standard.removeObject(forKey: USER_ID)
    }
}
