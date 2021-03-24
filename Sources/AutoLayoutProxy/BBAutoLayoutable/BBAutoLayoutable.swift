//
//  BBAutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public protocol BBAutoLayoutable: AnyObject, BBAnchorable {

    associatedtype View: BBAutoLayoutable

    var superview: View? { get }

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

public extension BBAutoLayoutable {

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

extension UIView: BBAutoLayoutable { }

#elseif canImport(AppKit)
import AppKit.NSView

extension NSView: BBAutoLayoutable { }

#endif
