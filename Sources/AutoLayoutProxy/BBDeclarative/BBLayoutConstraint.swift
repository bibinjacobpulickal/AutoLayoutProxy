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

public protocol BBLayoutConstraint: AnyObject {

  var identifier: String? { get set }

  var constant: CGFloat { get set }

  var multiplier: CGFloat { get }

  init(
    item view1: Any,
    attribute attr1: NSLayoutConstraint.Attribute,
    relatedBy relation: NSLayoutConstraint.Relation,
    toItem view2: Any?,
    attribute attr2: NSLayoutConstraint.Attribute,
    multiplier: CGFloat,
    constant c: CGFloat
  )

  var firstItem: AnyObject? { get }

  var secondItem: AnyObject? { get }

  var firstAttribute: NSLayoutConstraint.Attribute { get }

  var secondAttribute: NSLayoutConstraint.Attribute { get }

  var relation: NSLayoutConstraint.Relation { get }

#if canImport(UIKit)
  var priority: UILayoutPriority { get set }
#elseif canImport(Cocoa)
  var priority: NSLayoutConstraint.Priority { get set }
#endif

  var shouldBeArchived: Bool { get set }

  static func deactivate(_ :[Self])

  static func activate(_ :[Self])

  var isActive: Bool { get set }
}

public extension BBLayoutConstraint {

  @discardableResult func identifier(_ id: String?) -> Self {
    identifier = id
    return self
  }

  @discardableResult func constant(_ value: CGFloat) -> Self {
    constant = value
    return self
  }

  @discardableResult func multiplier(_ multiplier: CGFloat) -> Self {

    let newConstraint = Self(
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

    Self.deactivate([self])
    Self.activate([newConstraint])
    return newConstraint
  }

  @discardableResult func priority(_ value: BBPriorityConvertible) -> Self {
    priority = value.priorityValue
    return self
  }

  @discardableResult func activate() -> Self {
    isActive = true
    return self
  }

  @discardableResult func deactivate() -> Self {
    isActive = false
    return self
  }
}

extension NSLayoutConstraint: BBLayoutConstraint { }
