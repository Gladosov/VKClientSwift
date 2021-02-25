//
// FriendsInteractor.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

final class FriendsInteractor {
    private let userSettings = UserSettings.shared
    private let friendsService = FriendsService()
}

// MARK: - Extensions -

extension FriendsInteractor: FriendsInteractorInterface {
    func loadFriends(offset: Int, completion: @escaping ([User]) -> ()) {
        friendsService.fetchFriends(
            userId: userSettings.userId,
            offset: offset,
            accessToken: userSettings.accessToken) { result in
                switch result {
                case .success(let response):
                    completion(response.response.items)
                case .failure(let error):
                    print(error)
                }
        }
        
    }
}
