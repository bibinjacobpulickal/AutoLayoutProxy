//
//  BBPriorityConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 15/03/23.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public protocol BBPriorityConvertible {
#if canImport(UIKit)
  var priorityValue: UILayoutPriority { get }
#elseif canImport(Cocoa)
  var priorityValue: NSLayoutConstraint.Priority { get }
#endif
}

#if canImport(UIKit)
extension UILayoutPriority: BBPriorityConvertible {
  public var priorityValue: UILayoutPriority { self }
}

extension Float: BBPriorityConvertible {
  public var priorityValue: UILayoutPriority { UILayoutPriority(self) }
}

extension CGFloat: BBPriorityConvertible {
  public var priorityValue: UILayoutPriority { UILayoutPriority(Float(self)) }
}
#elseif canImport(Cocoa)
extension NSLayoutConstraint.Priority: BBPriorityConvertible {
  public var priorityValue: NSLayoutConstraint.Priority { self }
}

extension Float: BBPriorityConvertible {
  public var priorityValue: NSLayoutConstraint.Priority { NSLayoutConstraint.Priority(self) }
}

extension CGFloat: BBPriorityConvertible {
  public var priorityValue: NSLayoutConstraint.Priority { NSLayoutConstraint.Priority(Float(self)) }
}
#endif
