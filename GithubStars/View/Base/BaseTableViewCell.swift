//
//  BaseTableViewCell.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 04/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    func commonInit() {
        self.addSubviews()
        self.layout()
        self.configure()
    }

    open func addSubviews() {}
    open func layout() {}
    open func configure() {}

}
