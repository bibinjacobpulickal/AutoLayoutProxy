//
//  BBAutoLayoutableQuadrupleOperators.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 12/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit.NSLayoutAnchor
#elseif canImport(AppKit)
import AppKit.NSLayoutAnchor
#endif

// MARK: Quadruple Anchor Constraint With Relation

@discardableResult public func ==<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        [lhs.0.0 == rhs.0.0,
         lhs.0.1 == rhs.0.1,
         lhs.1.0 == rhs.1.0,
         lhs.1.1 == rhs.1.1]
}

@discardableResult public func <=<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        [lhs.0.0 <= rhs.0.0,
         lhs.0.1 <= rhs.0.1,
         lhs.1.0 <= rhs.1.0,
         lhs.1.1 <= rhs.1.1]
}

@discardableResult public func >=<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)))
    -> [NSLayoutConstraint] {
        [lhs.0.0 >= rhs.0.0,
         lhs.0.1 >= rhs.0.1,
         lhs.1.0 >= rhs.1.0,
         lhs.1.1 >= rhs.1.1]
}

// MARK: - Quadruple Anchor And Constant Combinations

public func + (lhs: ((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)),
               rhs: BBEdgeInsetConvertible)
    -> (((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)), BBEdgeInsetConvertible) {
        (lhs, rhs)
}

public func - (lhs: ((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)),
               rhs: BBEdgeInsetConvertible)
    -> (((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
    (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>)), BBEdgeInsetConvertible) {
        (lhs, rhs)
}

// MARK: - Quadruple Anchor Constraint With Constant And Relation

@discardableResult public func ==<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), BBEdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        [lhs.0.0 == rhs.0.0.0 + rhs.1.top,
         lhs.0.1 == rhs.0.0.1 + rhs.1.left,
         lhs.1.0 == rhs.0.1.0 - rhs.1.bottom,
         lhs.1.1 == rhs.0.1.1 - rhs.1.right]
}

@discardableResult public func <=<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), BBEdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        [lhs.0.0 <= rhs.0.0.0 + rhs.1.top,
         lhs.0.1 <= rhs.0.0.1 + rhs.1.left,
         lhs.1.0 <= rhs.0.1.0 - rhs.1.bottom,
         lhs.1.1 <= rhs.0.1.1 - rhs.1.right]
}

@discardableResult public func >=<
    FirstAnchorType: NSObject,
    SecondAnchorType: NSObject,
    ThirdAnchorType: NSObject,
    FourthAnchorType: NSObject>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), BBEdgeInsetConvertible))
    -> [NSLayoutConstraint] {
        [lhs.0.0 >= rhs.0.0.0 + rhs.1.top,
         lhs.0.1 >= rhs.0.0.1 + rhs.1.left,
         lhs.1.0 >= rhs.0.1.0 - rhs.1.bottom,
         lhs.1.1 >= rhs.0.1.1 - rhs.1.right]
}
