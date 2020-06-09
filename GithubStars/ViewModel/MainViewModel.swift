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

    func fetchData(_ completion: @escaping (() -> Void)) {
        Service().fetchData { (resultData, error) in
            if resultData != nil {
                self.resultData = resultData
                completion()
            } else {
                print(error?.localizedDescription ?? "")
            }
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
