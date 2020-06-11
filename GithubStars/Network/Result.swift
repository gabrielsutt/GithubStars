//
//  Result.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 11/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error)
}
