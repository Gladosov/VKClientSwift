//
// User.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

// MARK: - FrindsResponse
struct FrindsResponse: Codable {
    let response: FreindsResponseDetail
}

// MARK: - FreindsResponseDetail
struct FreindsResponseDetail: Codable {
    let count: Int
    let items: [User]
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool?
    let photo200_Orig: String
    let online: Int
    let trackCode: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo200_Orig = "photo_200_orig"
        case online
        case trackCode = "track_code"
    }
}
