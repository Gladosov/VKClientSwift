//
// FriendsService.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Alamofire

class FriendsService {
    private lazy var httpService = FriendsHttpService()
}

extension FriendsService: FriendsAPI {
    func fetchFriends(userId: Int, offset: Int, accessToken: String, completion: @escaping (Result<FrindsResponse, FriendsAPIError>) -> ()) {
        do {
            try FriendsHttpRouter.get(userId: userId, offset: offset, accessToken: accessToken)
                .request(using: httpService)
                .responseJSON { (result) in
                    guard let data = result.data else {
                        completion(.failure(.parseError()))
                        return
                    }
                    do {
                        let friendsResponse = try JSONDecoder().decode(FrindsResponse.self, from: data)
                        completion(.success(friendsResponse))
                    }
                    catch {
                        completion(.failure(.parseError(message: error.localizedDescription)))
                    }
                    //completion(friendsResponse)
                }
        }
        catch {
            completion(.failure(.apiError(message: error.localizedDescription)))
        }
    }
}
