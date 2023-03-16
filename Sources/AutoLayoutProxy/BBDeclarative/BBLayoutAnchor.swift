//
//  BBLayoutAnchor.swift
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

public protocol BBLayoutAnchor {
  func constraint(equalTo: Self,
                  constant: CGFloat) -> NSLayoutConstraint
  func constraint(greaterThanOrEqualTo: Self,
                  constant: CGFloat) -> NSLayoutConstraint
  func constraint(lessThanOrEqualTo: Self,
                  constant: CGFloat) -> NSLayoutConstraint
}

public extension BBLayoutAnchor {

  @discardableResult func equalTo(
    _ anchor: Self,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(equalTo: anchor,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ anchor: Self,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualTo: anchor,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ anchor: Self,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualTo: anchor,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }
}

extension NSLayoutAnchor: BBLayoutAnchor { }
