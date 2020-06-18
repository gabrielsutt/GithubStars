//
//  ViewControllerSpec.swift
//  GithubStarsTests
//
//  Created by Gabriel Souza de Oliveira on 18/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit
import Nimble_Snapshots
import Nimble
import Quick
@testable import GithubStars

class GithubStarsTests: QuickSpec {

    override func spec() {

        describe("testing main view controller") {

            var window: UIWindow!
            var sut: ViewController!
            var viewModel: MainViewModel!

            beforeEach {
                window = UIWindow(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
                window.makeKeyAndVisible()

                let apiMock = API(mockResponse: APIProviderMock.mockResponse())
                let service = Service(api: apiMock)
                viewModel = MainViewModel(service: service)
                viewModel.fetchData {}
            }

            afterEach {
                UIView.setAnimationsEnabled(false)
                window.isHidden = true
                window = nil
                viewModel = nil
            }

            context("snapshot") {

                beforeEach {
                    sut = ViewController()
                    sut.mainView.viewModel = viewModel
                    window.rootViewController = sut
                }
                
                it("should show populated table view") {
                    expect(sut) == snapshot("default_state")
                }
            }
        }
    }
}
