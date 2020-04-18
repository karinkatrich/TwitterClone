//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Karyna Katrich on 4/12/20.
//  Copyright © 2020 karyna.com. All rights reserved.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {

    //MARK: - Properties

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        //logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()

    }

    //MARK: - Selectors

    @objc func actionButtonTapped() {

    }

    //MARK: - Helpers

    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
        

    }

    //MARK: - API

    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureViewController()
            configureUI()
        }
    }

    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Failed to sign out \(error.localizedDescription)")
        }
    }

    func configureViewController() {
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: feed)

        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: explore)

        let notifications = NotificationController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected")!, rootViewController: notifications)

        let conversations = ConversationController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1")!, rootViewController: conversations)

        viewControllers = [nav1, nav2, nav3, nav4]
    }

    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }


}
