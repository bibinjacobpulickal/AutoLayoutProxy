//
//  AutoLayoutableExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension AutoLayoutable {

    func addSubview(_ view: AutoLayoutable, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        layoutView(view, using: layout)
    }

    func layoutView(_ view: AutoLayoutable, using closure: (LayoutProxy) -> Void) {
        view.translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: view, superView: self))
    }
}
