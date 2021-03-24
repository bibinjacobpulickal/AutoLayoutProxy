//
//  BBAnchorableHelper.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 05/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit.NSLayoutAnchor
#elseif canImport(AppKit)
import AppKit.NSLayoutAnchor
#endif

public extension BBAnchorable {

    var leading: NSLayoutXAxisAnchor {
        leadingAnchor
    }

    var trailing: NSLayoutXAxisAnchor {
        trailingAnchor
    }

    var left: NSLayoutXAxisAnchor {
        leftAnchor
    }

    var right: NSLayoutXAxisAnchor {
        rightAnchor
    }

    var top: NSLayoutYAxisAnchor {
        topAnchor
    }

    var bottom: NSLayoutYAxisAnchor {
        bottomAnchor
    }

    var width: NSLayoutDimension {
        widthAnchor
    }

    var height: NSLayoutDimension {
        heightAnchor
    }

    var centerX: NSLayoutXAxisAnchor {
        centerXAnchor
    }

    var centerY: NSLayoutYAxisAnchor {
        centerYAnchor
    }

    var size: (NSLayoutDimension, NSLayoutDimension) {
        (widthAnchor, heightAnchor)
    }

    var centers: (NSLayoutXAxisAnchor, NSLayoutYAxisAnchor) {
        (centerXAnchor, centerYAnchor)
    }

    var horizontal: (NSLayoutXAxisAnchor, NSLayoutXAxisAnchor) {
        (leadingAnchor, trailingAnchor)
    }

    var vertical: (NSLayoutYAxisAnchor, NSLayoutYAxisAnchor) {
        (topAnchor, bottomAnchor)
    }

    var sides: ((NSLayoutYAxisAnchor, NSLayoutXAxisAnchor),
        (NSLayoutYAxisAnchor, NSLayoutXAxisAnchor)) {
        ((topAnchor, leadingAnchor), (bottomAnchor, trailingAnchor))
    }
}
