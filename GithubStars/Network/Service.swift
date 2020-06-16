//
//  Service.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation

class Service {

    let api: API?

    init(api: API = API()) {
        self.api = api
    }

    func fetchData(callback: @escaping (Result<ResultData>) -> Void) {

        api?.resquest { (apiResponse) in

            if let response = apiResponse.urlResponse, response.isResponseOK(), let data = apiResponse.data {
                do {
                    let resultData = try JSONDecoder().decode(ResultData.self, from: data)
                    callback(.success(resultData))

                } catch {
                    print(error.localizedDescription)
                    callback(.error(error))
                }

            } else {
                let error = NSError(domain: "unknown", code: -1, userInfo: nil)
                callback(.error(error))
            }
        }
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
