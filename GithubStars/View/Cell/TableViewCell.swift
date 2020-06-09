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

    let numberOfStarsPrefix = "Stars:"
    let authorPrefix = "Author:"

    var avatarUrl: URL?
    let avatarImageView = UIImageView()
    let repositoryNameLabel = UILabel()
    let numberOfStarsLabel = UILabel()
    let authorNameLabel = UILabel()

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
        self.avatarImageView.layer.cornerRadius = 40
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.backgroundColor = .green
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.repositoryNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.numberOfStarsLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.authorNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)

        self.fetchAvatarImage()
    }

    private func fetchAvatarImage() {
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(
            with: avatarUrl,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage ]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}

