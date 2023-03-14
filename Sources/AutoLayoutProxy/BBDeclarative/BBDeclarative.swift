//
//  BBDeclarative.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 15/03/23.
//  Copyright © 2023 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension NSLayoutAnchor {

  @discardableResult @objc func equalTo(
    _ anchor: NSLayoutAnchor<AnchorType>,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = self.constraint(equalTo: anchor,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult @objc func greaterThanOrEqualTo(
    _ anchor: NSLayoutAnchor<AnchorType>,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = self.constraint(greaterThanOrEqualTo: anchor,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult @objc func lessThanOrEqualTo(
    _ anchor: NSLayoutAnchor<AnchorType>,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = self.constraint(lessThanOrEqualTo: anchor,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }
}

public extension NSLayoutDimension {

  @discardableResult func equalTo(
    _ anchor: NSLayoutDimension,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = self.constraint(equalTo: anchor,
                                       multiplier: multiplier,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ anchor: NSLayoutDimension,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = self.constraint(greaterThanOrEqualTo: anchor,
                                       multiplier: multiplier,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ anchor: NSLayoutDimension,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = self.constraint(lessThanOrEqualTo: anchor,
                                       multiplier: multiplier,
                                       constant: constant)
      constraint.isActive = true
      return constraint
    }
}

public extension NSLayoutConstraint {

  @discardableResult func constant(_ value: CGFloat) -> NSLayoutConstraint {
    constant = value
    return self
  }

  @discardableResult func priority(_ value: BBPriorityConvertible) -> NSLayoutConstraint {
    priority = value.priorityValue
    return self
  }

  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }

  @discardableResult func deactivate() -> NSLayoutConstraint {
    isActive = false
    return self
  }
}
