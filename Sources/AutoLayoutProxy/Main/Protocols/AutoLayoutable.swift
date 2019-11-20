//
//  AutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public protocol AutoLayoutable: AnyObject, Anchorable {

    associatedtype View: AutoLayoutable

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

extension AutoLayoutable {

    var tamic: Bool {
        set {
            translatesAutoresizingMaskIntoConstraints = newValue
        }
        get {
            translatesAutoresizingMaskIntoConstraints
        }
    }
}

#if canImport(UIKit)

extension UIView: AutoLayoutable { }

#elseif canImport(Cocoa)

extension NSView: AutoLayoutable { }

#endif
