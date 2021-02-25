//
// FriendsHttpRouter.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Alamofire

enum FriendsHttpRouter {
    case get(userId: Int, offset: Int, accessToken: String)
    case downloadPhoto(url: String)
}

extension FriendsHttpRouter: HttpRouter {
    var baseURL: String {
        return "https://api.vk.com/method"
    }
    
    var path: String {
        switch self {
        case .get(_, _, _):
            return "friends.get"
        case .downloadPhoto(_):
            fatalError("downloadPhoto needs to be implemented")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get(_, _, _), .downloadPhoto(_):
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json; charset=UTF-8"
        ]
    }
    
    var parameters: Parameters? {
        switch self {
        case .get(let userId, let offset, let accessToken):
            return [
                "user_id": "\(userId)",
                "count": "10",
                "offset": "\(offset)",
                "fields": "photo_200_orig",
                "access_token": "\(accessToken)",
                "v": "5.122"
            ]
        default:
            return nil
        }
    }
}
