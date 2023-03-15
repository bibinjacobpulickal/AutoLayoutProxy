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
      let constraint = constraint(equalTo: anchor,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult @objc func greaterThanOrEqualTo(
    _ anchor: NSLayoutAnchor<AnchorType>,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualTo: anchor,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult @objc func lessThanOrEqualTo(
    _ anchor: NSLayoutAnchor<AnchorType>,
    constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualTo: anchor,
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
      let constraint = constraint(equalTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ anchor: NSLayoutDimension,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ anchor: NSLayoutDimension,
    constant: CGFloat = 0,
    multiplier: CGFloat = 1) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualTo: anchor,
                                  multiplier: multiplier,
                                  constant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func equalTo(
    _ constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(equalToConstant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func greaterThanOrEqualTo(
    _ constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(greaterThanOrEqualToConstant: constant)
      constraint.isActive = true
      return constraint
    }

  @discardableResult func lessThanOrEqualTo(
    _ constant: CGFloat = 0) -> NSLayoutConstraint {
      let constraint = constraint(lessThanOrEqualToConstant: constant)
      constraint.isActive = true
      return constraint
    }
}

public extension NSLayoutConstraint {

  @discardableResult func constant(_ value: CGFloat) -> NSLayoutConstraint {
    constant = value
    return self
  }

  @discardableResult func multiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {

      NSLayoutConstraint.deactivate([self])

      let newConstraint = NSLayoutConstraint(
          item: firstItem as Any,
          attribute: firstAttribute,
          relatedBy: relation,
          toItem: secondItem,
          attribute: secondAttribute,
          multiplier: multiplier,
          constant: constant)

      newConstraint.priority = priority
      newConstraint.shouldBeArchived = shouldBeArchived
      newConstraint.identifier = identifier

      NSLayoutConstraint.activate([newConstraint])
      return newConstraint
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
