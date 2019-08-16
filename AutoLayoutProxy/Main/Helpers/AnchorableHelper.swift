//
//  AnchorableHelper.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 05/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension Anchorable {

    var leading: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        return leadingAnchor
    }

    var trailing: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        return trailingAnchor
    }

    var left: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        return leftAnchor
    }

    var right: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        return rightAnchor
    }

    var top: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        return topAnchor
    }

    var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        return bottomAnchor
    }

    var width: NSLayoutDimension {
        return widthAnchor
    }

    var height: NSLayoutDimension {
        return heightAnchor
    }

    var centerX: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        return centerXAnchor
    }

    var centerY: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        return centerYAnchor
    }

    var size: (NSLayoutDimension, NSLayoutDimension) {
        return (widthAnchor, heightAnchor)
    }

    var centers: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        return (centerXAnchor, centerYAnchor)
    }

    var horizontal: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        return (leadingAnchor, trailingAnchor)
    }

    var vertical: (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        return (topAnchor, bottomAnchor)
    }

    var sides: (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>,
        NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        return (topAnchor, leadingAnchor, bottomAnchor, trailingAnchor)
    }
}
