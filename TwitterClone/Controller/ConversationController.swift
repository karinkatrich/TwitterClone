//
//  ConversationController.swift
//  TwitterClone
//
//  Created by Karyna Katrich on 4/12/20.
//  Copyright © 2020 karyna.com. All rights reserved.
//

import UIKit

class ConversationController: UIViewController {

    //MARK: - Properties

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Helpers

    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
}
