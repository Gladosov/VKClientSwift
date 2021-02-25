//
// FriendsPresenter.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import Foundation

final class FriendsPresenter {

    // MARK: - Private properties -

    private unowned let view: FriendsViewInterface
    private let interactor: FriendsInteractorInterface
    private let wireframe: FriendsWireframeInterface
    
    private var friendsArray: [User] = []
    private var currentOffset: Int = 0

    // MARK: - Lifecycle -

    init(view: FriendsViewInterface, interactor: FriendsInteractorInterface, wireframe: FriendsWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func loadFriends() {
        interactor.loadFriends(offset: currentOffset) { [weak self] (users) in
            self?.friends.append(contentsOf: users)
            self?.view.onUpdate()
        }
    }
}

// MARK: - Extensions -

extension FriendsPresenter: FriendsPresenterInterface {
        
    var friends: [User] {
        get {
            friendsArray
        }
        set {
            self.friendsArray = newValue
        }
    }
    
    var friendsCount: Int {
        friends.count
    }
    
    var tableRowHeight: Double {
        100
    }
    
    func viewDidLoad() {
        loadFriends()
    }
    
    func loadMoreFriends() {
        currentOffset += 10
        loadFriends()
    }
}
