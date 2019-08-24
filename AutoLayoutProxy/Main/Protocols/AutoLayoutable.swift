//
//  AutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol AutoLayoutable: AnyObject, Anchorable {

    associatedtype View: AutoLayoutable

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

#if canImport(UIKit)

extension UIView: AutoLayoutable { }

#elseif canImport(Cocoa)

extension NSView: AutoLayoutable { }

#endif
