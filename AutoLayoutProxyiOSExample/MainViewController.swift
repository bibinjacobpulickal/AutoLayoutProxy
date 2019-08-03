//
//  MainViewController.swift
//  AutoLayoutProxyiOSExample
//
//  Created by Frankenstein on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import AutoLayoutProxy

class MainViewController: UIViewController {

    let button: UIButton = create { button in
        button.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button,
                        anchors: .bothCenters,
                        size: 100)
    }
}

class View: UIView {

    let button: UIButton = create { button in
        button.backgroundColor = .red
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button,
                   anchors: .bothCenters,
                   size: 100)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
