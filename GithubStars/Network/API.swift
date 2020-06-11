//
//  API.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 11/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

class API {

    private let urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars"

    private let session = URLSession.shared
    
    private let mockResponse: APIResponse?

    init(mockResponse: APIResponse? = nil) {
        self.mockResponse = mockResponse
    }

    func resquest(callback: @escaping (APIResponse) -> Void) {
        if let mockResponse = mockResponse { callback(mockResponse); return }
        guard let url = URL(string: urlString) else { return }
        session.dataTask(with: url) { (data, response, error) in
            let response = APIResponse(data: data, error: error, urlResponse: response)
            callback(response)
        }.resume()
    }
}
