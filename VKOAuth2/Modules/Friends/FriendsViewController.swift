//
// FriendsViewController.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

final class FriendsViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FriendsPresenterInterface!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "FriendCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FriendCell.identifier)
        
        self.navigationItem.title = "Мои друзья"
    }

}

// MARK: - Extensions -

extension FriendsViewController: FriendsViewInterface {
    func onUpdate() {
        self.tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.friendsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as! FriendCell
        
        let user = presenter.friends[indexPath.row]
        cell.configure(with: user)
        
        cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height / 2)
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.05, options: .curveEaseInOut, animations: {
            cell.alpha = 1
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(presenter.tableRowHeight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.friendsCount - 1 {
            presenter.loadMoreFriends()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: nil, animated: false, scrollPosition: .none)
    }
}
