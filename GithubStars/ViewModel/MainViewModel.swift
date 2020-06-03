//
//  MainViewModel.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

class MainViewModel {

    var resultData: ResultData?

    func fetchData() {
        Service().fetchData { (resultData, error) in
            if resultData != nil {
                self.resultData = resultData
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
    
}
