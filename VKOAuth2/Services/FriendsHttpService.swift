//
// FriendsHttpService.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Alamofire

final class FriendsHttpService: HttpService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
