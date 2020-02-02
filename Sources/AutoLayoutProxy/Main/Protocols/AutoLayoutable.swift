//
//  AutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public protocol AutoLayoutable: AnyObject, Anchorable {

    associatedtype View: AutoLayoutable

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

public extension AutoLayoutable {

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
import UIKit.UIView

extension UIView: AutoLayoutable { }

#elseif canImport(AppKit)
import AppKit.NSView

extension NSView: AutoLayoutable { }

#endif
