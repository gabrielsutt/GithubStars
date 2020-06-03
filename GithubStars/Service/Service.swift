//
//  Service.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

class Service {
    
    let urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars"

    func fetchData(completion: @escaping ((ResultData?, Error?) -> Void)) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let response = response, response.isResponseOK() {
                do {
                    let resultData = try JSONDecoder().decode(ResultData.self, from: data!)
                    completion(resultData, nil)

                } catch {
                    print(error.localizedDescription)
                    completion(nil, error)

                }
            } else {
                let error = NSError(domain: "unknown", code: -1, userInfo: nil)
                completion(nil, error)
            }

        }

        task.resume()
    }
}

private extension URLResponse {
    func isResponseOK() -> Bool {
        if let response = self as? HTTPURLResponse {
            return (200...299).contains(response.statusCode)
        }
        return false
    }
}
