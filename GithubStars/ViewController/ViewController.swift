//
//  ViewController.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    init(with view: UIView = MainView()) {
        super.init(nibName: nil, bundle: nil)
        self.view = view
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.view = MainView()
    }

}

