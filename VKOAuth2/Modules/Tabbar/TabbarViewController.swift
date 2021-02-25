//
// TabbarViewController.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit

final class TabbarViewController: UITabBarController {



    var presenter: TabbarPresenterInterface!



    override func viewDidLoad() {
        super.viewDidLoad()
    }

}



extension TabbarViewController: TabbarViewInterface {
}
