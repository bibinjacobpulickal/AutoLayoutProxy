//
//  AutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Frankenstein on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol AutoLayoutable: AnyObject, Anchorable {

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: AutoLayoutable)
}

public extension AutoLayoutable {

    func addSubview(_ view: AutoLayoutable, layout: (() -> Void)) -> Void {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }
}

#if canImport(UIKit)
extension UIView: AutoLayoutable {
    public func addSubview(_ view: AutoLayoutable) {
        if let view = view as? UIView {
            addSubview(view)
        }
    }
}
#elseif canImport(Cocoa)
extension NSView: AutoLayoutable {
    public func addSubview(_ view: AutoLayoutable) {
        if let view = view as? NSView {
            addSubview(view)
        }
    }
}
#endif
