//
//  MainViewController.swift
//  AutoLayutProxyMacOSExample
//
//  Created by Frankenstein on 03/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import AutoLayoutProxy

class MainViewController: NSViewController {

    override func loadView() {
        view    = NSView()
        view.anchor(lhs: .width, relation: .greaterThanOrEqual, rhs: 300)
        view.anchor(lhs: .height, relation: .greaterThanOrEqual, rhs: 300)
    }
}
