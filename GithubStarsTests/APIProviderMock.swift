//
//  APIProviderMock.swift
//  GithubStarsTests
//
//  Created by Gabriel Souza de Oliveira on 18/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Foundation
@testable import GithubStars

class APIProviderMock {
    
    static func mockResponse() -> APIResponse {
        var response: APIResponse
        
        if let data = self.getDataFromJson() {
            response = APIResponse(data: data,
                                   error: nil,
                                   urlResponse: HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:]))
            return response
        }
        return APIResponse(data: nil, error: nil, urlResponse: nil)
    }
    
    private static func getDataFromJson() -> Data? {
        if let path = Bundle(for: GithubStarsTests.self).path(forResource: "ResultData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
