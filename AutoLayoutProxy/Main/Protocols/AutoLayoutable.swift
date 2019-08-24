//
//  AutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Frankenstein on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol AutoLayoutable: AnyObject, Anchorable {

    associatedtype View: AutoLayoutable

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

public extension AutoLayoutable {

    func addSubview(_ view: View, layout: (() -> Void)) -> Void {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }

    func addSubview(_ view: View, layout: ((View) -> Void)) -> Void {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout(view)
    }
}

#if canImport(UIKit)

extension UIView: AutoLayoutable { }

#elseif canImport(Cocoa)

extension NSView: AutoLayoutable { }

#endif
