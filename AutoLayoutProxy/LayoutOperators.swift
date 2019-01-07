//
//  LayoutOperators.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 15/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public func *<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs, rhs, 0)
}

public func /<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs, 1/rhs, 0)
}

public func +<A: LayoutDimension>(lhs: (A, CGFloat, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs.0, lhs.1, rhs)
}

public func -<A: LayoutDimension>(lhs: (A, CGFloat, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs.0, lhs.1, -rhs)
}

public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func ==<A: LayoutDimension>(lhs: LayoutSize<A>, rhs: CGSize) {
    if rhs.width != 0 {
        lhs.width.equal(to: rhs.width)
    }
    if rhs.height != 0 {
        lhs.height.equal(to: rhs.height)
    }
}

public func >=<A: LayoutDimension>(lhs: LayoutSize<A>, rhs: CGSize) {
    if rhs.width != 0 {
        lhs.width.greaterThanOrEqual(to: rhs.width)
    }
    if rhs.height != 0 {
        lhs.height.greaterThanOrEqual(to: rhs.height)
    }
}

public func <=<A: LayoutDimension>(lhs: LayoutSize<A>, rhs: CGSize) {
    if rhs.width != 0 {
        lhs.width.lessThanOrEqual(to: rhs.width)
    }
    if rhs.height != 0 {
        lhs.height.lessThanOrEqual(to: rhs.height)
    }
}

public func ==<A: LayoutDimension>(lhs: LayoutSide<A>, rhs: CGFloat) {
    lhs.verticalSide.equal(to: rhs)
    lhs.horizontalSide.equal(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutSide<A>, rhs: CGFloat) {
    lhs.verticalSide.greaterThanOrEqual(to: rhs)
    lhs.horizontalSide.greaterThanOrEqual(to: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutSide<A>, rhs: CGFloat) {
    lhs.verticalSide.lessThanOrEqual(to: rhs)
    lhs.horizontalSide.lessThanOrEqual(to: rhs)
}
