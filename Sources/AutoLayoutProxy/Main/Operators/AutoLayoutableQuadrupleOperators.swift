//
//  AutoLayoutableQuadrupleOperators.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 12/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

// MARK: Quadruple Anchor Constraint With Relation

@discardableResult public func ==<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(equalTo: rhs.0.0))
        constraints.append(lhs.0.1.constraint(equalTo: rhs.0.1))
        constraints.append(lhs.1.0.constraint(equalTo: rhs.1.0))
        constraints.append(lhs.1.1.constraint(equalTo: rhs.1.1))
        NSLayoutConstraint.activate(constraints)
        return constraints
}

@discardableResult public func <=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(lessThanOrEqualTo: rhs.0.0))
        constraints.append(lhs.0.1.constraint(lessThanOrEqualTo: rhs.0.1))
        constraints.append(lhs.1.0.constraint(lessThanOrEqualTo: rhs.1.0))
        constraints.append(lhs.1.1.constraint(lessThanOrEqualTo: rhs.1.1))
        NSLayoutConstraint.activate(constraints)
        return constraints
}

@discardableResult public func >=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(greaterThanOrEqualTo: rhs.0.0))
        constraints.append(lhs.0.1.constraint(greaterThanOrEqualTo: rhs.0.1))
        constraints.append(lhs.1.0.constraint(greaterThanOrEqualTo: rhs.1.0))
        constraints.append(lhs.1.1.constraint(greaterThanOrEqualTo: rhs.1.1))
        NSLayoutConstraint.activate(constraints)
        return constraints
}

// MARK: - Quadruple Anchor And Constant Combinations

public func + (lhs: ((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)),
               rhs: EdgeInsetConvertible)
    -> (((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)), EdgeInsetConvertible) {
        (lhs, rhs)
}

// MARK: - Quadruple Anchor Constraint With Constant And Relation

@discardableResult public func ==<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(equalTo: rhs.0.0.0, constant: rhs.1.top))
        constraints.append(lhs.0.1.constraint(equalTo: rhs.0.0.1, constant: rhs.1.left))
        constraints.append(lhs.1.0.constraint(equalTo: rhs.0.1.0, constant: rhs.1.bottom))
        constraints.append(lhs.1.1.constraint(equalTo: rhs.0.1.1, constant: rhs.1.right))
        NSLayoutConstraint.activate(constraints)
        return constraints
}

@discardableResult public func <=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(lessThanOrEqualTo: rhs.0.0.0, constant: rhs.1.top))
        constraints.append(lhs.0.1.constraint(lessThanOrEqualTo: rhs.0.0.1, constant: rhs.1.left))
        constraints.append(lhs.1.0.constraint(lessThanOrEqualTo: rhs.0.1.0, constant: rhs.1.bottom))
        constraints.append(lhs.1.1.constraint(lessThanOrEqualTo: rhs.0.1.1, constant: rhs.1.right))
        NSLayoutConstraint.activate(constraints)
        return constraints
}

@discardableResult public func >=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lhs.0.0.constraint(greaterThanOrEqualTo: rhs.0.0.0, constant: rhs.1.top))
        constraints.append(lhs.0.1.constraint(greaterThanOrEqualTo: rhs.0.0.1, constant: rhs.1.left))
        constraints.append(lhs.1.0.constraint(greaterThanOrEqualTo: rhs.0.1.0, constant: rhs.1.bottom))
        constraints.append(lhs.1.1.constraint(greaterThanOrEqualTo: rhs.0.1.1, constant: rhs.1.right))
        NSLayoutConstraint.activate(constraints)
        return constraints
}
