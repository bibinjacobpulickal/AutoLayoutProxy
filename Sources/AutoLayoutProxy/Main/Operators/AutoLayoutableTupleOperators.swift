//
//  AutoLayoutableTupleOperators.swift
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

// MARK: Double Anchor Constraint

@discardableResult public func == <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>))
    -> [NSLayoutConstraint] {
        [lhs.0 == rhs.0, lhs.1 == rhs.1]
}

@discardableResult public func <= <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>))
    -> [NSLayoutConstraint] {
        [lhs.0 <= rhs.0, lhs.1 <= rhs.1]
}

@discardableResult public func >= <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>))
    -> [NSLayoutConstraint] {
        [lhs.0 >= rhs.0, lhs.1 >= rhs.1]
}

// MARK: - Double Dimension Anchor Constraint With Constant And Relation

@discardableResult public func == (lhs: (NSLayoutDimension, NSLayoutDimension), rhs: SizeConvertible)
    -> [NSLayoutConstraint] {
        [lhs.0 == rhs.width, lhs.1 == rhs.height]
}

@discardableResult public func <= (lhs: (NSLayoutDimension, NSLayoutDimension), rhs: SizeConvertible)
    -> [NSLayoutConstraint] {
        [lhs.0 <= rhs.width, lhs.1 <= rhs.height]
}

@discardableResult public func >= (lhs: (NSLayoutDimension, NSLayoutDimension), rhs: SizeConvertible)
    -> [NSLayoutConstraint] {
        [lhs.0 >= rhs.width, lhs.1 >= rhs.height]
}

// MARK: - Double Anchor And Constant Combinations

public func + (lhs: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>),
               rhs: OffsetConvertible)
    -> ((NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>), (CGFloat, CGFloat)) {
        ((lhs.0, lhs.1), (rhs.horizontal, rhs.vertical))
}

public func + (lhs: (NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>),
               rhs: EdgeInsetConvertible)
    -> ((NSLayoutAnchor<NSLayoutXAxisAnchor>, NSLayoutAnchor<NSLayoutXAxisAnchor>), (CGFloat, CGFloat)) {
        ((lhs.0, lhs.1), (rhs.left, rhs.right))
}

public func + (lhs: (NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>),
               rhs: EdgeInsetConvertible)
    -> ((NSLayoutAnchor<NSLayoutYAxisAnchor>, NSLayoutAnchor<NSLayoutYAxisAnchor>), (CGFloat, CGFloat)) {
        ((lhs.0, lhs.1), (rhs.top, rhs.bottom))
}

// MARK: - Double Anchor Constraint With Constant And Relation

@discardableResult public func == <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: ((NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>), (CGFloat, CGFloat)))
    -> [NSLayoutConstraint] {
        [lhs.0 == rhs.0.0 + rhs.1.0, lhs.1 == rhs.0.1 + rhs.1.1]
}

@discardableResult public func <= <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: ((NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>), (CGFloat, CGFloat)))
    -> [NSLayoutConstraint] {
        [lhs.0 <= rhs.0.0 + rhs.1.0, lhs.1 <= rhs.0.1 + rhs.1.1]
}

@discardableResult public func >= <LeftAnchorType: NSObject, RightAnchorType: NSObject>(
    lhs: (NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>),
    rhs: ((NSLayoutAnchor<LeftAnchorType>, NSLayoutAnchor<RightAnchorType>), (CGFloat, CGFloat)))
    -> [NSLayoutConstraint] {
        [lhs.0 >= rhs.0.0 + rhs.1.0, lhs.1 >= rhs.0.1 + rhs.1.1]
}
