//
//  ViewController.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = self.mainView
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.view = self.mainView
    }

}

