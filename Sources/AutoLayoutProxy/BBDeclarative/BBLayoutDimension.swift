//
//  BBLayoutDimension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 16/03/23.
//  Copyright © 2023 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public protocol BBLayoutDimension: BBLayoutAnchor {
  func constraint(equalTo: Self,
                  multiplier: CGFloat,
                  constant: CGFloat) -> NSLayoutConstraint
  func constraint(greaterThanOrEqualTo: Self,
                  multiplier: CGFloat,
                  constant: CGFloat) -> NSLayoutConstraint
  func constraint(lessThanOrEqualTo: Self,
                  multiplier: CGFloat,
                  constant: CGFloat) -> NSLayoutConstraint

  func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
  func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
  func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
}

public extension BBLayoutDimension {

  @discardableResult func equalTo(
    _ anchor: Self,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = constraint(equalTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ anchor: Self,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ anchor: Self,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func equalTo(
    _ constant: CGFloat) -> NSLayoutConstraint {
      let constraint = constraint(equalToConstant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ constant: CGFloat) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualToConstant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ constant: CGFloat) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualToConstant: constant)
      constraint.isActive = true
      return constraint
    }
}

extension NSLayoutDimension: BBLayoutDimension { }
