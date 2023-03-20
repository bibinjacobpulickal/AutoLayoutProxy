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

  @discardableResult func addArrangedSubview(_ view: View, layout: (() -> Void)) -> View {
    addArrangedSubview(view)
    view.tamic()
    layout()
    return view
  }

  @discardableResult func addArrangedSubview(_ view: View, layout: ((View) -> Void)) -> View {
    addArrangedSubview(view)
    view.tamic()
    layout(view)
    return view
  }

  @discardableResult func addArrangedSubview(_ view: View, layout: ((View, Self) -> Void)) -> View {
    addArrangedSubview(view)
    view.tamic()
    layout(view, self)
    return view
  }
}
