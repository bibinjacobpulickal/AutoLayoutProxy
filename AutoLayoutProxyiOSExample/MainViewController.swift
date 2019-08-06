//
//  MainViewController.swift
//  AutoLayoutProxyiOSExample
//
//  Created by Frankenstein on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import AutoLayoutProxy

class MainViewController: UIViewController {

    override func loadView() {
        super.loadView()
        view    = MainView()
    }
}

class MainView: UIView {

    let button: UIButton = create { button in
        button.backgroundColor = .green
        button.setTitle("Button", for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(button) {
            button.centerX  == centerX
            button.centerY  == centerY
            button.size     == CGSize(width: 100, height: 50)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
