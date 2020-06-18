//
//  EditProfileFooter.swift
//  TwitterClone
//
//  Created by Karyna Katrich on 6/11/20.
//  Copyright © 2020 karyna.com. All rights reserved.
//

import UIKit

protocol EditProfileFooterDelegate: class {
    func handleLogout()
}

class EditProfileFooter: UIView {

    //MARK: - Properties

    weak var delegate: EditProfileFooterDelegate?

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()


    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoutButton)
        logoutButton.center(inView: self)
        logoutButton.anchor(left: leftAnchor, right: rightAnchor,
                            paddingLeft: 16, paddingRight: 16)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleLogout() {
        delegate?.handleLogout()
    }
}
