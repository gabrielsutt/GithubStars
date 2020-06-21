//
//  TableViewCell.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 04/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit
import Stevia
import Kingfisher

class TableViewCell: BaseTableViewCell {

    static let resusableIdentifier = "TableViewCell"

    private let numberOfStarsPrefix = "Stars:"
    private let authorPrefix = "Author:"

    private var avatarUrl: URL?
    private let avatarImageView = UIImageView()
    private let repositoryNameLabel = UILabel()
    private let numberOfStarsLabel = UILabel()
    private let authorNameLabel = UILabel()

    func setup(withAvatarUrl avatarUrl: URL?,
               repositoryName: String,
               numberOfStars: Int,
               authorName: String) {

        self.avatarUrl = avatarUrl
        self.repositoryNameLabel.text = repositoryName
        self.numberOfStarsLabel.text = "\(numberOfStarsPrefix) \(numberOfStars)"
        self.authorNameLabel.text = "\(authorPrefix) \(authorName)"

        self.commonInit()
    }

    override func addSubviews() {
        super.addSubviews()
        sv(avatarImageView)
        sv(repositoryNameLabel)
        sv(numberOfStarsLabel)
        sv(authorNameLabel)
    }

    override func layout() {
        super.layout()

        avatarImageView.left(20)
        avatarImageView.height(80)
        avatarImageView.heightEqualsWidth()
        avatarImageView.centerVertically()
        repositoryNameLabel.Top == avatarImageView.Top
        repositoryNameLabel.Left == avatarImageView.Right + 20
        repositoryNameLabel.height(20)
        numberOfStarsLabel.Top == repositoryNameLabel.Bottom + 2
        numberOfStarsLabel.Left == avatarImageView.Right + 20
        numberOfStarsLabel.height(20)
        authorNameLabel.Top == numberOfStarsLabel.Bottom
        authorNameLabel.Left == avatarImageView.Right + 20
        authorNameLabel.height(20)
    }

    override func configure() {
        super.configure()
//        self.selectionStyle = .none
        self.backgroundColor = .purple
        self.avatarImageView.layer.cornerRadius = 40
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.backgroundColor = .green
        self.repositoryNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.numberOfStarsLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.authorNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)

        avatarImageView.kf.indicatorType = .activity
        API().fetchAvatarImage(into: avatarImageView, avatarUrl: avatarUrl)

    }
}

