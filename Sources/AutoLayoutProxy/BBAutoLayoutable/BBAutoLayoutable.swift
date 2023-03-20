//
//  BBAutoLayoutable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 02/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public protocol BBAutoLayoutable: AnyObject, BBAnchorable {

    associatedtype View: BBAutoLayoutable

    var superview: View? { get }

    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    func addSubview(_ view: View)
}

public extension BBAutoLayoutable {

  @available(*, deprecated, message: "Migrate to declarative tamic(_ bool: Bool) method instead.")
  var tamic: Bool {
    set {
      translatesAutoresizingMaskIntoConstraints = newValue
    }
    get {
      translatesAutoresizingMaskIntoConstraints
    }
  }

  @discardableResult func tamic(_ bool: Bool = false) -> Self {
    translatesAutoresizingMaskIntoConstraints = bool
    return self
  }
}

#if canImport(UIKit)
import UIKit.UIView

extension UIView: BBAutoLayoutable {

  @discardableResult public func addSuperview(_ superView: UIView?) -> UIView {
    superView?.addSubview(self)
    self.tamic()
    return self
  }
}

#elseif canImport(AppKit)
import AppKit.NSView

extension NSView: BBAutoLayoutable {

  @discardableResult public func addSuperview(_ superView: NSView?) -> NSView {
    superView?.addSubview(self)
    self.tamic()
    return self
  }
}

#endif
