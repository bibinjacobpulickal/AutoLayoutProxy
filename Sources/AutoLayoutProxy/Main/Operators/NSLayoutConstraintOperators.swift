//
//  NSLayoutConstraintOperators.swift
//  
//
//  Created by Bibin Jacob Pulickal on 09/02/20.
//

#if canImport(UIKit)
import UIKit.NSLayoutConstraint
#elseif canImport(AppKit)
import AppKit.NSLayoutConstraint
#endif

public func + (lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> [NSLayoutConstraint] {
    [lhs, rhs]
}

public func +=(lhs: inout [NSLayoutConstraint], rhs: NSLayoutConstraint) {
    lhs.append(rhs)
}

public func +=(lhs: inout [NSLayoutConstraint], rhs: [NSLayoutConstraint]) {
    lhs.append(contentsOf: rhs)
}
