//
// FriendsAPI.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

protocol FriendsAPI {
    func fetchFriends(userId: Int, offset: Int, accessToken: String, completion: @escaping (Result<FrindsResponse, FriendsAPIError>) -> ())
}

enum FriendsAPIError: Error {
    case apiError(message: String = "")
    case parseError(message: String = "")
}
