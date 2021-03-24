//
//  BBAutoLayoutableOperators.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 06/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

// MARK: Operator Declarations

infix operator !<=: InActivePrecedence
infix operator !>=: InActivePrecedence

// MARK: Precedence Group Declaration

precedencegroup InActivePrecedence {
    lowerThan: AdditionPrecedence
    higherThan: AssignmentPrecedence
}

// MARK: - Single Anchor Constraint With Active Status

@discardableResult public func == <AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func == (
    lhs: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    rhs: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func == (
    lhs: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    rhs: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func == (
    lhs: NSLayoutAnchor<NSLayoutDimension>,
    rhs: NSLayoutAnchor<NSLayoutDimension>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

// MARK: - Single Anchor Constraint With Inactive Status

public func != <AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = false
    return constraint
}

@discardableResult public func != (
    lhs: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    rhs: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = false
    return constraint
}

@discardableResult public func != (
    lhs: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    rhs: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = false
    return constraint
}

@discardableResult public func != (
    lhs: NSLayoutAnchor<NSLayoutDimension>,
    rhs: NSLayoutAnchor<NSLayoutDimension>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalTo: rhs)
    constraint.isActive = false
    return constraint
}

// MARK: - Single Anchor Constraint With Relation And Active Status

@discardableResult public func <=<AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(lessThanOrEqualTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func >=<AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(greaterThanOrEqualTo: rhs)
    constraint.isActive = true
    return constraint
}

// MARK: - Single Anchor Constraint With Relation And Inactive Status

public func !<=<AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(lessThanOrEqualTo: rhs)
    constraint.isActive = false
    return constraint
}

public func !>=<AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(greaterThanOrEqualTo: rhs)
    constraint.isActive = false
    return constraint
}

// MARK: - Single Anchor And Constant Combinations

public func +<AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: CGFloat) -> (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)) {
    (lhs, (1, rhs))
}

public func -<AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: CGFloat) -> (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)) {
    (lhs, (1, -rhs))
}

public func * (
    lhs: NSLayoutAnchor<NSLayoutDimension>,
    rhs: CGFloat) -> (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)) {
    (lhs, (rhs, 0))
}

public func / (
    lhs: NSLayoutAnchor<NSLayoutDimension>,
    rhs: CGFloat) -> (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)) {
    (lhs, (1/rhs, 0))
}

public func + (
    lhs: (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)),
    rhs: CGFloat) -> (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)) {
    (lhs.0, (lhs.1.0, rhs))
}

public func - (
    lhs: (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)),
    rhs: CGFloat) -> (NSLayoutAnchor<NSLayoutDimension>, (CGFloat, CGFloat)) {
    (lhs.0, (lhs.1.0, -rhs))
}

// MARK: - Single Anchor Constraint With Constant, Relation And Active Status

@discardableResult public func ==<AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(equalTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        } else {
            let constraint      = lhs.constraint(equalTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        }
}

@discardableResult public func <=<AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(lessThanOrEqualTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        } else {
            let constraint      = lhs.constraint(lessThanOrEqualTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        }
}

@discardableResult public func >=<AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(greaterThanOrEqualTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        } else {
            let constraint      = lhs.constraint(greaterThanOrEqualTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = true
            return constraint
        }
}

// MARK: - Single Anchor Constraint With Constant, Relation And Inactive Status

public func != <AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(equalTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        } else {
            let constraint      = lhs.constraint(equalTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        }
}

public func !<= <AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(lessThanOrEqualTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        } else {
            let constraint      = lhs.constraint(lessThanOrEqualTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        }
}

public func !>= <AnchorType: NSObject>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: (NSLayoutAnchor<AnchorType>, (CGFloat, CGFloat)))
    -> NSLayoutConstraint {
        if let lhsAnchor        = lhs as? NSLayoutDimension,
            let rhsAnchor       = rhs.0 as? NSLayoutDimension {
            let constraint      = lhsAnchor.constraint(greaterThanOrEqualTo: rhsAnchor,
                                                       multiplier: rhs.1.0,
                                                       constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        } else {
            let constraint      = lhs.constraint(greaterThanOrEqualTo: rhs.0, constant: rhs.1.1)
            constraint.isActive = false
            return constraint
        }
}

// MARK: - Single Dimension Anchor Constraint With Constant, Relation And Active Status

@discardableResult public func == (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalToConstant: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func <= (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(lessThanOrEqualToConstant: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult public func >= (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(greaterThanOrEqualToConstant: rhs)
    constraint.isActive = true
    return constraint
}

// MARK: - Single Dimension Anchor Constraint With Constant, Relation And Inactive Status

public func != (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(equalToConstant: rhs)
    constraint.isActive = false
    return constraint
}

public func !<= (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(lessThanOrEqualToConstant: rhs)
    constraint.isActive = false
    return constraint
}

public func !>= (
    lhs: NSLayoutDimension,
    rhs: CGFloat) -> NSLayoutConstraint {
    let constraint      = lhs.constraint(greaterThanOrEqualToConstant: rhs)
    constraint.isActive = false
    return constraint
}
