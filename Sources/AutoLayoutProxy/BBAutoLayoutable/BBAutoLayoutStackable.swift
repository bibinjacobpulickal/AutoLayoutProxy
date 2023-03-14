//
//  BBAutoLayoutStackable.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob on 24/06/21.
//  Copyright © 2021 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public protocol BBAutoLayoutStackable: AnyObject {

  associatedtype View: BBAutoLayoutable

  func addArrangedSubview(_ view: View)
}

#if canImport(UIKit)
import UIKit.UIView

extension UIStackView: BBAutoLayoutStackable { }

#elseif canImport(AppKit)
import AppKit.NSView

extension NSStackView: BBAutoLayoutStackable { }

#endif

// MARK: - Helpers

public extension BBAutoLayoutStackable {

  func addArrangedSubview(_ view: View, layout: (() -> Void)) {
    addArrangedSubview(view)
    view.tamic = false
    layout()
  }

  func addArrangedSubview(_ view: View, layout: ((View) -> Void)) {
    addArrangedSubview(view)
    view.tamic = false
    layout(view)
  }

  func addArrangedSubview(_ view: View, layout: ((View, Self) -> Void)) {
    addArrangedSubview(view)
    view.tamic = false
    layout(view, self)
  }
}
