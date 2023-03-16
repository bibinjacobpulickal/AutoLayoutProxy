//
//  AutoLayoutProxyTests.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 15/03/23.
//  Copyright © 2023 Bibin Jacob Pulickal. All rights reserved.
//

import XCTest
@testable import AutoLayoutProxy

final class AutoLayoutProxyTests: XCTestCase {

  static var allLayoutKitTests = [
    ("testAddSubview", testAddSubview),
    ("testAddArrangedSubview", testAddArrangedSubview),
    ("testTamic", testTamic),
    ("testLayoutYAxisAnchors_withConstant", testLayoutYAxisAnchors_withConstant),
    ("testLayoutYAxisAnchors_withoutConstant", testLayoutYAxisAnchors_withoutConstant),
    ("testLayoutXAxisAnchors1_withConstant", testLayoutXAxisAnchors1_withConstant),
    ("testLayoutXAxisAnchors1_withoutConstant", testLayoutXAxisAnchors1_withoutConstant),
    ("testLayoutXAxisAnchors2_withConstant", testLayoutXAxisAnchors2_withConstant),
    ("testLayoutXAxisAnchors2_withoutConstant", testLayoutXAxisAnchors2_withoutConstant),
    ("testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withConstant", testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withConstant),
    ("testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withoutConstant", testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withoutConstant),
    ("testLayoutDimensionAnchors_withSecondViewAnchor_withoutMultiplier_withConstant", testLayoutDimensionAnchors_withSecondViewAnchor_withoutMultiplier_withConstant),
    ("testLayoutDimensionAnchors_withoutSecondViewAnchor_withoutMultiplier_withConstant", testLayoutDimensionAnchors_withoutSecondViewAnchor_withoutMultiplier_withConstant)
  ]

#if canImport(UIKit)
  private let firstView  = UIView()
  private let secondView = UIView()
  private let stackView  = UIStackView()
  private let priorities = [UILayoutPriority.required,
                            .defaultHigh,
                            .dragThatCanResizeScene,
                            .sceneSizeStayPut,
                            .dragThatCannotResizeScene,
                            .defaultLow,
                            .fittingSizeLevel]
#elseif canImport(AppKit)
  private let firstView  = NSView()
  private let secondView = NSView()
  private let stackView  = NSStackView()
  private let priorities = [NSLayoutConstraint.Priority.required,
                            .defaultHigh,
                            .dragThatCanResizeWindow,
                            .windowSizeStayPut,
                            .dragThatCannotResizeWindow,
                            .defaultLow,
                            .fittingSizeCompression]
#endif
  private let layoutStyles = LayoutStyles.allCases
  private let relations    = [NSLayoutConstraint.Relation.equal,
                              .greaterThanOrEqual,
                              .lessThanOrEqual]
  private let isActives    = [true, false]

  func initialSetup() {
    firstView.addSubview(secondView) { }
  }

  func testAddSubview() {

    initialSetup()

    XCTAssertTrue(firstView.subviews.contains(secondView))
    XCTAssertEqual(secondView.superview, firstView)
  }

  func testAddArrangedSubview() {

    stackView.addArrangedSubview(secondView) { }

    XCTAssertTrue(stackView.arrangedSubviews.contains(secondView))
    XCTAssertEqual(secondView.superview, stackView)
  }

  func testTamic() {
    initialSetup()
    XCTAssertFalse(secondView.tamic)
  }

  func testLayoutYAxisAnchors_withConstant() {

    initialSetup()

    getLayoutYAxisAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutYAxisAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutYAxisAnchors_withoutConstant() {

    initialSetup()

    getLayoutYAxisAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutYAxisAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutYAxisAnchorRelationsAndPriorities(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutYAxisAnchorRelationsAndPriorities(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func getLayoutYAxisAnchorAttributesForView(_ view: BBAnchorable) -> [(anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)] {
    [
      (view.top, .top),
      (view.bottom, .bottom),
      (view.centerY, .centerY)
    ]
  }

  func testLayoutXAxisAnchors1_withConstant() {

    initialSetup()

    getLayoutXAxisAnchorAttributesForView1(firstView).forEach { firstViewAnchor in
      getLayoutXAxisAnchorAttributesForView1(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutXAxisAnchors1_withoutConstant() {

    initialSetup()

    getLayoutXAxisAnchorAttributesForView1(firstView).forEach { firstViewAnchor in
      getLayoutXAxisAnchorAttributesForView1(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func getLayoutXAxisAnchorAttributesForView1(_ view: BBAnchorable) -> [(anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)] {
    [
      (view.leading, .leading),
      (view.trailing, .trailing),
      (view.centerX, .centerX)
    ]
  }

  func testLayoutXAxisAnchors2_withConstant() {

    initialSetup()

    getLayoutXAxisAnchorAttributesForView2(firstView).forEach { firstViewAnchor in
      getLayoutXAxisAnchorAttributesForView2(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutXAxisAnchors2_withoutConstant() {

    initialSetup()

    getLayoutXAxisAnchorAttributesForView2(firstView).forEach { firstViewAnchor in
      getLayoutXAxisAnchorAttributesForView2(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsAndPriorities(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsAndPriorities(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func getLayoutXAxisAnchorAttributesForView2(_ view: BBAnchorable) -> [(anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)] {
    [
      (view.left, .left),
      (view.right, .right),
      (view.centerX, .centerX)
    ]
  }

  func testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withConstant() {

    initialSetup()

    getLayoutDimensionAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutDimensionAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withoutConstant() {

    initialSetup()

    getLayoutDimensionAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutDimensionAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withSecondViewAnchor_withoutMultiplier_withConstant() {

    initialSetup()

    getLayoutDimensionAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutDimensionAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor,
              secondViewAnchor: secondViewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withoutSecondViewAnchor_withoutMultiplier_withConstant() {

    initialSetup()

    getLayoutDimensionAnchorAttributesForView(firstView).forEach { firstViewAnchor in
      getLayoutDimensionAnchorAttributesForView(secondView).forEach { secondViewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              firstViewAnchor: firstViewAnchor)
          }
        }
      }
    }
  }

  func getLayoutDimensionAnchorAttributesForView(_ view: BBAnchorable) -> [(anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)] {
    [
      (view.width, .width),
      (view.height, .height)
    ]
  }

  func testImperativeLayoutYAxisAnchorRelationsAndPriorities(
    firstViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutYAxisAnchorRelationsAndPriorities(
    firstViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutXAxisAnchorRelationsAndPriorities(
    firstViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutXAxisAnchorRelationsAndPriorities(
    firstViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= constant
              } else {
                constraint = firstViewAnchor.anchor !<= constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= constant
              } else {
                constraint = firstViewAnchor.anchor !>= constant
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == constant
              } else {
                constraint = firstViewAnchor.anchor != constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor + constant
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = CGFloat([0.5, 1.5, 2.0].randomElement() ?? 1)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor * multiplier
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor * multiplier
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor * multiplier
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor * multiplier
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor * multiplier
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor * multiplier
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = CGFloat([0.5, 1.5, 2.0].randomElement() ?? 1)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = CGFloat([0.5, 1.5, 2.0].randomElement() ?? 1)
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor <= secondViewAnchor.anchor * multiplier + constant
              } else {
                constraint = firstViewAnchor.anchor !<= secondViewAnchor.anchor * multiplier + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor >= secondViewAnchor.anchor * multiplier + constant
              } else {
                constraint = firstViewAnchor.anchor !>= secondViewAnchor.anchor * multiplier + constant
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor == secondViewAnchor.anchor * multiplier + constant
              } else {
                constraint = firstViewAnchor.anchor != secondViewAnchor.anchor * multiplier + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
    firstViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    secondViewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = CGFloat([0.5, 1.5, 2.0].randomElement() ?? 1)
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .lessThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .greaterThanOrEqualTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = firstViewAnchor.anchor
                  .equalTo(secondViewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: firstViewAnchor.attribute,
              secondAttribute: secondViewAnchor.attribute,
              relation: relation,
              constant: constant,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

#if canImport(UIKit)

  func testConstraint(
    _ constraint: NSLayoutConstraint,
    firstAttribute: NSLayoutConstraint.Attribute,
    secondAttribute: NSLayoutConstraint.Attribute? = nil,
    relation: NSLayoutConstraint.Relation = .equal,
    constant: CGFloat                     = 0,
    multiplier: CGFloat                   = 1,
    priority: UILayoutPriority            = .required,
    isActive: Bool                        = true) {

      XCTAssertEqual(constraint.firstItem as? NSObject, firstView)
      XCTAssertEqual(constraint.firstAttribute, firstAttribute)
      if let secondAttribute {
        XCTAssertEqual(constraint.secondItem as? NSObject, secondView)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
      } else {
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
      }
      XCTAssertEqual(constraint.relation, relation)
      XCTAssertEqual(constraint.constant, constant)
      XCTAssertEqual(constraint.multiplier, multiplier)
      XCTAssertEqual(constraint.priority, priority)
      XCTAssertEqual(constraint.isActive, isActive)
    }

#elseif canImport(AppKit)

  func testConstraint(
    _ constraint: NSLayoutConstraint,
    firstAttribute: NSLayoutConstraint.Attribute,
    secondAttribute: NSLayoutConstraint.Attribute? = nil,
    relation: NSLayoutConstraint.Relation = .equal,
    constant: CGFloat                     = 0,
    multiplier: CGFloat                   = 1,
    priority: NSLayoutConstraint.Priority = .required,
    isActive: Bool                        = true) {

      XCTAssertEqual(constraint.firstItem as? NSObject, firstView)
      XCTAssertEqual(constraint.firstAttribute, firstAttribute)
      if let secondAttribute {
        XCTAssertEqual(constraint.secondItem as? NSObject, secondView)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
      } else {
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
      }
      XCTAssertEqual(constraint.relation, relation)
      XCTAssertEqual(constraint.constant, constant)
      XCTAssertEqual(constraint.multiplier, multiplier)
      XCTAssertEqual(constraint.priority, priority)
      XCTAssertEqual(constraint.isActive, isActive)
    }

#endif
}

private enum LayoutStyles: CaseIterable {
  case imperative
  case declarative
}

