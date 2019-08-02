//
//  MainViewController.swift
//  AutoLayoutProxyiOSExample
//
//  Created by Frankenstein on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import AutoLayoutProxy

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .contactAdd)
        view.backgroundColor = .white
        view.addSubview(button,
                        anchors: .bothCenters)
    }
}
