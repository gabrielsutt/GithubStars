//
//  BaseView.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 02/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    public convenience init() {
        self.init(frame: .zero)
    }

    open func commonInit() {
        self.addSubviews()
        self.layout()
        self.configure()
    }

    open func addSubviews() {}
    open func layout() {}
    open func configure() {}

}
