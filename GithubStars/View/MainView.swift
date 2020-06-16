//
//  MainView.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit
import Stevia

class MainView: BaseView {
    
    var viewModel = MainViewModel()

    private var tableView = UITableView()
    private var refreshControl = UIRefreshControl()
    private var activityIndicator = UIActivityIndicatorView(style: .large)

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        self.viewModel.fetchData({
            DispatchQueue.main.async {
                self.tableView.reloadData()

                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
                self.activityIndicator.stopAnimating()
            }
        })
    }

    override func addSubviews() {
        super.addSubviews()

        sv(self.tableView)
        sv(self.activityIndicator)
    }

    override func layout() {
        super.layout()

        self.tableView.fillContainer()
        self.activityIndicator.fillContainer()

    }

    override func configure() {
        super.configure()

        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TableViewCell.self,
                                forCellReuseIdentifier: self.viewModel.cellIdentifier)
        self.tableView.backgroundColor = .purple

        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }

    @objc
    private func refresh(_ sender: AnyObject) {
        self.setup()
    }

}

extension MainView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.resultData?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.viewModel.cellIdentifier, for: indexPath) as? TableViewCell
        
        cell?.setup(withAvatarUrl: self.viewModel.avatarUrl(at: indexPath),
                    repositoryName: self.viewModel.repositoryName(at: indexPath),
                    numberOfStars: self.viewModel.numberOfStars(at: indexPath),
                    authorName: self.viewModel.authorName(at: indexPath))

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

}

extension MainView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
