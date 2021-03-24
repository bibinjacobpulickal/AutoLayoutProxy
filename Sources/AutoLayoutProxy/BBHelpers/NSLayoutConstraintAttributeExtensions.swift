//
//  NSLayoutConstraintAttributeExtensions.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit.NSLayoutConstraint
#elseif canImport(AppKit)
import AppKit.NSLayoutConstraint
#endif

public extension Set where Element == NSLayoutConstraint.Attribute {

    static var allSides: Set<NSLayoutConstraint.Attribute> {
         [.top, .leading, .bottom, .trailing]
    }

    static var horizontal: Set<NSLayoutConstraint.Attribute> {
         [.leading, .trailing]
    }

    static var vertical: Set<NSLayoutConstraint.Attribute> {
         [.top, .bottom]
    }

    static var bothCenters: Set<NSLayoutConstraint.Attribute> {
         [.centerX, .centerY]
    }

    static var bothDimensions: Set<NSLayoutConstraint.Attribute> {
         [.width, .height]
    }
}
