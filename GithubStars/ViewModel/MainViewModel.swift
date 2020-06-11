//
//  MainViewModel.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

class MainViewModel {

    let cellIdentifier = TableViewCell.resusableIdentifier
    var resultData: ResultData?
    private var service: Service

    init(service: Service = Service()) {
        self.service = service
    }

    func fetchData(_ completion: @escaping (() -> Void)) {
        service.fetchData { (result) in
            switch result {
            case .success(let data):
                self.resultData = data
            case .error(let e):
                print(e.localizedDescription)
            }
            completion()
        }
    }

    func numberOfRepositories() -> Int {
        return resultData?.items.count ?? 0
    }

    func repositories() -> [Item] {
        return resultData?.items ?? []
    }

    func avatarUrl(at indexPath: IndexPath) -> URL? {
        return URL(string: self.resultData?.items[indexPath.row].owner.avatarURL ?? "")
    }

    func repositoryName(at indexPath: IndexPath) -> String {
        return self.resultData?.items[indexPath.row].name ?? ""
    }

    func numberOfStars(at indexPath: IndexPath) -> Int {
        return self.resultData?.items[indexPath.row].stargazersCount ?? 0
    }

    func authorName(at indexPath: IndexPath) -> String {
        return self.resultData?.items[indexPath.row].owner.login ?? ""
    }
    
}
