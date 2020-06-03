//
//  MainView.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class MainView: BaseView {
    
    let viewModel = MainViewModel()

    private var tableView = UITableView()

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        self.viewModel.fetchData()
    }

    // Layout
    override func addSubviews() {
        self.addSubview(self.tableView)
    }

    override func layout() {
//        self.tableView.constraints.

    }

    override func configure() {

    }

}
