//
// HttpService.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Alamofire

protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
