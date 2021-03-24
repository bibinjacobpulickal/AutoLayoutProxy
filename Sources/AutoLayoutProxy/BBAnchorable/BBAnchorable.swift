//
//  BBAnchorable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 14/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit.NSLayoutAnchor
#elseif canImport(AppKit)
import AppKit.NSLayoutAnchor
#endif

public protocol BBAnchorable {

    var leadingAnchor: NSLayoutXAxisAnchor { get }

    var trailingAnchor: NSLayoutXAxisAnchor { get }

    var leftAnchor: NSLayoutXAxisAnchor { get }

    var rightAnchor: NSLayoutXAxisAnchor { get }

    var topAnchor: NSLayoutYAxisAnchor { get }

    var bottomAnchor: NSLayoutYAxisAnchor { get }

    var widthAnchor: NSLayoutDimension { get }

    var heightAnchor: NSLayoutDimension { get }

    var centerXAnchor: NSLayoutXAxisAnchor { get }

    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

#if canImport(UIKit)

extension UILayoutGuide: BBAnchorable { }

#endif
