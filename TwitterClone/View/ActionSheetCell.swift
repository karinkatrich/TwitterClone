//
//  ActionSheetCell.swift
//  TwitterClone
//
//  Created by Karyna Katrich on 5/9/20.
//  Copyright © 2020 karyna.com. All rights reserved.
//

import UIKit

class ActionSheetCell: UITableViewCell {

    //MARK: - Properties

    var option: ActionSheetOptions? {
        didSet { configure() }
    }

    private lazy var optionImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "twitter_logo_blue")
        return iv
    }()

    private let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18)
         label.text = "Test option"
         return label
     }()

    //MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(optionImageView)
        optionImageView.centerY(inView: self)
        optionImageView.anchor(left: leftAnchor, paddingLeft: 8)
        optionImageView.setDimensions(width: 36, height: 36)

        addSubview(titleLabel)
        titleLabel.centerY(inView: self)
        titleLabel.anchor(left: optionImageView.rightAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Helpers

    func configure() {
        titleLabel.text = option?.description
    }
}