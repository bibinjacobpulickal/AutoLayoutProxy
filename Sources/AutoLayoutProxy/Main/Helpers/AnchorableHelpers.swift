//
//  AnchorableHelper.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 05/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension Anchorable {

    var leading: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        leadingAnchor
    }

    var trailing: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        trailingAnchor
    }

    var left: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        leftAnchor
    }

    var right: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        rightAnchor
    }

    var top: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        topAnchor
    }

    var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        bottomAnchor
    }

    var width: NSLayoutDimension {
        widthAnchor
    }

    var height: NSLayoutDimension {
        heightAnchor
    }

    var centerX: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        centerXAnchor
    }

    var centerY: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        centerYAnchor
    }

    var size: (NSLayoutDimension, NSLayoutDimension) {
        (widthAnchor, heightAnchor)
    }

    var centers: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        (centerXAnchor, centerYAnchor)
    }

    var horizontal: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        (leadingAnchor, trailingAnchor)
    }

    var vertical: (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        (topAnchor, bottomAnchor)
    }

    var sides: ((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
        (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)) {
        ((topAnchor, leadingAnchor), (bottomAnchor, trailingAnchor))
    }
}
