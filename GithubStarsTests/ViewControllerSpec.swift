//
//  ViewControllerSpec.swift
//  GithubStarsTests
//
//  Created by Gabriel Souza de Oliveira on 18/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import KIF

@testable import GithubStars

class ViewControllerSpec: KIFSpec {

    override func spec() {

        describe("testing main view controller") {

            var window: UIWindow!
            var sut: ViewController!
            var viewModel: MainViewModel!

            beforeEach {
                window = UIWindow(frame: CGRect(x: 0, y: 0, width: 414, height: 896))

                let apiMock = API(mockResponse: APIProviderMock.mockResponse())
                let service = Service(api: apiMock)
                viewModel = MainViewModel(service: service)
                viewModel.fetchData {}

                sut = ViewController()
                sut.mainView.viewModel = viewModel
                window.rootViewController = sut
            }

            afterEach {
                UIView.setAnimationsEnabled(false)
                window.isHidden = true
                window = nil
                viewModel = nil
            }

            context("snapshot") {

                it("should show populated table view") {
                    window.makeKeyAndVisible()
                    expect(sut) == recordSnapshot("default_state")
                }

                it("should show scrolled table view") {
                    tester().swipeView(withAccessibilityLabel: "Repositories informations list", in: .up)
                    tester().swipeView(withAccessibilityLabel: "Repositories informations list", in: .up)
                    tester().swipeView(withAccessibilityLabel: "Repositories informations list", in: .up)
                    expect(sut) == recordSnapshot("scrolled_state")
                }
            }
        }
    }
}
