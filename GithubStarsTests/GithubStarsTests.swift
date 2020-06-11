//
//  GithubStarsTests.swift
//  GithubStarsTests
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit
import Nimble_Snapshots
import Nimble
import Quick
@testable import GithubStars

class GithubStarsTests: QuickSpec {

    override func spec() {

        var viewModel: MainViewModel?

        describe("") {

            context("") {

                beforeEach {
                    let apiMock = API(mockResponse: self.mockResponse())
                    let service = Service(api: apiMock)
                    viewModel = MainViewModel(service: service)
                    viewModel!.fetchData {}
                }

                it("") {
                    expect(viewModel!.resultData).toNot(beNil())
                }

                afterEach {
                    viewModel = nil
                }
            }
        }
    }

    private func mockResponse() -> APIResponse {
        var response: APIResponse

        if let data = self.getDataFromJson() {
            response = APIResponse(data: data,
                                   error: nil,
                                   urlResponse: HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:]))
            return response
        }
        return APIResponse(data: nil, error: nil, urlResponse: nil)
    }

    private func getDataFromJson() -> Data? {
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
