//
//  ViewController.swift
//  GithubStars
//
//  Created by Gabriel Souza de Oliveira on 01/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.mainView

    }
    
}

