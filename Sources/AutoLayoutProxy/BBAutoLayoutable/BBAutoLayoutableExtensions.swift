//
//  AutoLayoutableExtensions.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 24/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension BBAutoLayoutable {

  @discardableResult  func addSubview(_ view: View, layout: (() -> Void)) -> View {
    addSubview(view)
    view.tamic()
    layout()
    return view
  }

  @discardableResult func addSubview(_ view: View, layout: ((View) -> Void)) -> View {
    addSubview(view)
    view.tamic()
    layout(view)
    return view
  }

  @discardableResult func addSubview(_ view: View, layout: ((View, Self) -> Void)) -> View {
    addSubview(view)
    view.tamic()
    layout(view, self)
    return view
  }

  @discardableResult func layout(_ layout: (Self) -> Void) -> Self {
    tamic()
    layout(self)
    return self
  }

  @discardableResult func layout(_ layout: (Self, View) -> Void) -> Self {
    tamic()
    if let superview { layout(self, superview) }
    return self
  }
}
