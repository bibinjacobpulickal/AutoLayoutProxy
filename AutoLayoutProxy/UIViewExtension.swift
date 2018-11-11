//
//  UIViewExtension.swift
//  AutoLayoutManager
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
    let object = T()
    setup(object)
    return object
}

public extension UIView {
    
    public func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layout(using: layout)
    }
    
    public func layout(using closure: (LayoutProxy) -> Void) {
        closure(LayoutProxy(view: self))
    }
}
