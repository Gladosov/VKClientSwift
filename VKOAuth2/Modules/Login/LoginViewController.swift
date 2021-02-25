//
// LoginViewController.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//
import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: LoginPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
    }
    
    

    // MARK: - Actions -
    @IBAction func tappedLogin(_ sender: Any) {
        self.presenter.tappedLogin()
    }
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    
}
