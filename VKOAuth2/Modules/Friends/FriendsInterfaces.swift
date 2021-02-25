//
// FriendsInterfaces.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

protocol FriendsWireframeInterface: WireframeInterface {
}

protocol FriendsViewInterface: ViewInterface {
    func onUpdate()
}

protocol FriendsPresenterInterface: PresenterInterface {
    var friends: [User] { get set }
    var friendsCount: Int { get }
    var tableRowHeight: Double { get }
    func viewDidLoad()
    func loadMoreFriends()
}

protocol FriendsInteractorInterface: InteractorInterface {
    func loadFriends(offset: Int, completion: @escaping ([User]) -> ())
}
