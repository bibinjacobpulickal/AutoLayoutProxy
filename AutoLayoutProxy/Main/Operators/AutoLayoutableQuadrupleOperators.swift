//
//  AutoLayoutableQuadrupleOperators.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 12/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

// MARK: Quadruple Anchor Constraint With Relation

public func ==<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>))) {
    lhs.0.0.constraint(equalTo: rhs.0.0).isActive   = true
    lhs.0.1.constraint(equalTo: rhs.0.1).isActive   = true
    lhs.1.0.constraint(equalTo: rhs.1.0).isActive   = true
    lhs.1.1.constraint(equalTo: rhs.1.1).isActive   = true
}

public func <=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>))) {
    lhs.0.0.constraint(lessThanOrEqualTo: rhs.0.0).isActive   = true
    lhs.0.1.constraint(lessThanOrEqualTo: rhs.0.1).isActive   = true
    lhs.1.0.constraint(lessThanOrEqualTo: rhs.1.0).isActive   = true
    lhs.1.1.constraint(lessThanOrEqualTo: rhs.1.1).isActive   = true
}

public func >=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>))) {
    lhs.0.0.constraint(greaterThanOrEqualTo: rhs.0.0).isActive   = true
    lhs.0.1.constraint(greaterThanOrEqualTo: rhs.0.1).isActive   = true
    lhs.1.0.constraint(greaterThanOrEqualTo: rhs.1.0).isActive   = true
    lhs.1.1.constraint(greaterThanOrEqualTo: rhs.1.1).isActive   = true
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

public func ==<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible)) {
    lhs.0.0.constraint(equalTo: rhs.0.0.0, constant: rhs.1.top).isActive    = true
    lhs.0.1.constraint(equalTo: rhs.0.0.1, constant: rhs.1.left).isActive   = true
    lhs.1.0.constraint(equalTo: rhs.0.1.0, constant: rhs.1.bottom).isActive = true
    lhs.1.1.constraint(equalTo: rhs.0.1.1, constant: rhs.1.right).isActive  = true
}

public func <=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible)) {
    lhs.0.0.constraint(lessThanOrEqualTo: rhs.0.0.0, constant: rhs.1.top).isActive    = true
    lhs.0.1.constraint(lessThanOrEqualTo: rhs.0.0.1, constant: rhs.1.left).isActive   = true
    lhs.1.0.constraint(lessThanOrEqualTo: rhs.0.1.0, constant: rhs.1.bottom).isActive = true
    lhs.1.1.constraint(lessThanOrEqualTo: rhs.0.1.1, constant: rhs.1.right).isActive  = true
}

public func >=<FirstAnchorType, SecondAnchorType, ThirdAnchorType, FourthAnchorType>(
    lhs: ((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)),
    rhs: (((NSLayoutAnchor<FirstAnchorType>, NSLayoutAnchor<SecondAnchorType>),
    (NSLayoutAnchor<ThirdAnchorType>, NSLayoutAnchor<FourthAnchorType>)), EdgeInsetConvertible)) {
    lhs.0.0.constraint(greaterThanOrEqualTo: rhs.0.0.0, constant: rhs.1.top).isActive    = true
    lhs.0.1.constraint(greaterThanOrEqualTo: rhs.0.0.1, constant: rhs.1.left).isActive   = true
    lhs.1.0.constraint(greaterThanOrEqualTo: rhs.0.1.0, constant: rhs.1.bottom).isActive = true
    lhs.1.1.constraint(greaterThanOrEqualTo: rhs.0.1.1, constant: rhs.1.right).isActive  = true
}
