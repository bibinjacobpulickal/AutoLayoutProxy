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
        view            = NSView()
        view.size       >= 300
        view.addSubview(NSView(color: .purple)) {
            $0.sides    == view.sides + 10
        }
    }
}

extension NSView {

    convenience init(color: NSColor) {
        self.init(frame: .zero)
        wantsLayer             = true
        layer?.backgroundColor = color.cgColor
    }
}
