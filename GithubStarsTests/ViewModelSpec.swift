//
//  ViewModelSpec.swift
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

class ViewModelSpec: QuickSpec {

    override func spec() {

        var viewModel: MainViewModel!

        describe("testing viewModel") {

            beforeEach {
                let apiMock = API(mockResponse: APIProviderMock.mockResponse())
                let service = Service(api: apiMock)
                viewModel = MainViewModel(service: service)
                viewModel.fetchData {}
            }

            context("testing view model and api") {

                it("result should be loaded successfully") {
                    expect(viewModel!.resultData).toNot(beNil())
                }

                it("should load items") {
                    expect(viewModel!.resultData?.items).toNot(beEmpty())
                }

                it("should get 711869 results") {
                    expect(viewModel!.resultData?.totalCount) == 711869
                }

                it("should get 711869 results") {
                    expect(viewModel!.numberOfRepositories()) == viewModel!.repositories().count
                }

                it("should set 'awesome-ios' to first item name") {
                    expect(viewModel!.resultData?.items[0].name) == "awesome-ios"
                }

                it("should set author name correctly") {
                    expect(viewModel!.authorName(at: IndexPath(row: 10, section: 0))) == "SwiftyJSON"
                }

                it("should cell identifier match") {
                    expect(viewModel!.cellIdentifier) == "TableViewCell"
                }

                it("should set right numbers of stars") {
                    expect(viewModel!.numberOfStars(at: IndexPath(row: 2, section: 0))) == 27955
                }

                it("should not be nil") {
                    expect(viewModel!.avatarUrl(at: IndexPath(row: 2, section: 0))).toNot(beNil())
                }

                it("should match value") {
                    expect(viewModel!.repositories().count) == 30
                }

                it("should get right repo name") {
                    expect(viewModel!.repositoryName(at: IndexPath(row: 2, section: 0))) == "ShadowsocksX-NG"
                }

                afterEach {
                    viewModel = nil
                }
            }
        }
    }
}
