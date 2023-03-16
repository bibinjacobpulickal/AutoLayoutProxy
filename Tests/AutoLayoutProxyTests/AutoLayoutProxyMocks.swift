//
//  AutoLayoutProxyMocks.swift
//  AutoLayoutProxyTests
//
//  Created by Bibin Jacob Pulickal on 16/03/23.
//  Copyright © 2023 Bibin Jacob Pulickal. All rights reserved.
//

import XCTest
@testable import AutoLayoutProxy

class MockView: Equatable, BBAutoLayoutable {

  var identifier = UUID().uuidString

  var superview: MockView?

  var subviews: [MockView] = []

  var translatesAutoresizingMaskIntoConstraints: Bool = false

  var leadingAnchor: NSLayoutXAxisAnchor = MockXAxisAnchor()

  var trailingAnchor: NSLayoutXAxisAnchor = MockXAxisAnchor()

  var leftAnchor: NSLayoutXAxisAnchor = MockXAxisAnchor()

  var rightAnchor: NSLayoutXAxisAnchor = MockXAxisAnchor()

  var topAnchor: NSLayoutYAxisAnchor = MockYAxisAnchor()

  var bottomAnchor: NSLayoutYAxisAnchor = MockYAxisAnchor()

  var widthAnchor: NSLayoutDimension = MockDimensionAnchor()

  var heightAnchor: NSLayoutDimension = MockDimensionAnchor()

  var centerXAnchor: NSLayoutXAxisAnchor = MockXAxisAnchor()

  var centerYAnchor: NSLayoutYAxisAnchor = MockYAxisAnchor()

  init() { }

  func addSubview(_ view: MockView) {
    subviews.append(view)
    view.superview = self
  }

  static func == (lhs: MockView, rhs: MockView) -> Bool {
    lhs.identifier == rhs.identifier
  }
}

final class MockStackView: MockView, BBAutoLayoutStackable {

  var arrangedSubviews: [MockView] = []

  func addArrangedSubview(_ view: MockView) {
    arrangedSubviews.append(view)
    view.superview = self
  }
}

final class MockXAxisAnchor: NSLayoutXAxisAnchor { }

final class MockYAxisAnchor: NSLayoutYAxisAnchor { }

final class MockDimensionAnchor: NSLayoutDimension { }
