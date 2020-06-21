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

@testable import GithubStars

class ViewControllerSpec: KIFSpec {

    override func spec() {

        describe("testing main view controller") {

            var window: UIWindow!
            var sut: ViewController!
            var mainView: MainView!
            var viewModel: MainViewModel!

            beforeEach {
                window = UIWindow(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
                window.makeKeyAndVisible()

                let apiMock = API(mockResponse: APIProviderMock.mockResponse())
                let service = Service(api: apiMock)
                viewModel = MainViewModel(service: service)
                viewModel.fetchData {}

                mainView = MainView()
                mainView.viewModel = viewModel
                mainView.translatesAutoresizingMaskIntoConstraints = false
                sut = ViewController(mainView: mainView)
                window.rootViewController = sut
            }

            afterEach {
                window.rootViewController = nil
                window.isHidden = true
                viewModel = nil
            }

            context("snapshot") {

                it("should show populated table view") {
//                    window.makeKeyAndVisible()
                    expect(sut) == recordSnapshot("default_state")
                }

                it("should show scrolled table view") {
//                    tester().tapRow(at: IndexPath(row: 0,section: 0),
//                                    inTableViewWithAccessibilityIdentifier: "Repositories informations list")
//                    tester().waitForCell(at: IndexPath(row: 5, section: 0),
//                                         inTableViewWithAccessibilityIdentifier: "Repositories informations list")

//                    viewTester().
                    tester().waitForAnimationsToFinish()
                    tester().tapRow(at: IndexPath(row: 15, section: 0), inTableViewWithAccessibilityIdentifier: "Repositories informations list")

//                    (withAccessibilityLabel: "Repositories informations list", in: .up)
//                    tester().swipeView(withAccessibilityLabel: "Repositories informations list", in: .up)
//                    tester().swipeView(withAccessibilityLabel: "Repositories informations list", in: .up)
//                    window.makeKeyAndVisible()
                    expect(sut) == recordSnapshot("scrolled_state")
                }
            }
        }
    }
}
