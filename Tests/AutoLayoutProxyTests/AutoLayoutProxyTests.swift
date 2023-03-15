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
  private let view       = UIView()
  private let subview    = UIView()
  private let stackView  = UIStackView()
  private let priorities = [UILayoutPriority.required,
                            .defaultHigh,
                            .dragThatCanResizeScene,
                            .sceneSizeStayPut,
                            .dragThatCannotResizeScene,
                            .defaultLow,
                            .fittingSizeLevel]
#elseif canImport(AppKit)
  private let view       = NSView()
  private let subview    = NSView()
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
  private let relations = [NSLayoutConstraint.Relation.equal,
                           .greaterThanOrEqual,
                           .lessThanOrEqual]
  private let isActives = [true, false]

  func initialSetup() {
    view.addSubview(subview) { }
  }

  func testAddSubview() {

    initialSetup()

    XCTAssertTrue(view.subviews.contains(subview))
    XCTAssertEqual(subview.superview, view)
  }

  func testAddArrangedSubview() {

    stackView.addArrangedSubview(subview) { }

    XCTAssertTrue(stackView.arrangedSubviews.contains(subview))
    XCTAssertEqual(subview.superview, stackView)
  }

  func testTamic() {
    initialSetup()
    XCTAssertFalse(subview.tamic)
  }

  func testLayoutYAxisAnchors_withConstant() {
    let viewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(view)
    let subviewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(subview)

    viewLayoutYAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutYAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutYAxisAnchors_withoutConstant() {
    let viewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(view)
    let subviewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(subview)

    viewLayoutYAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutYAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutYAxisAnchorRelationsAndPriorities(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutYAxisAnchorRelationsAndPriorities(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
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
    let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(view)
    let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(subview)

    viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutXAxisAnchors1_withoutConstant() {
    let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(view)
    let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(subview)

    viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
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
    let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(view)
    let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(subview)

    viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutXAxisAnchors2_withoutConstant() {
    let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(view)
    let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(subview)

    viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
      subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutXAxisAnchorRelationsAndPriorities(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutXAxisAnchorRelationsAndPriorities(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
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
    let viewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(view)
    let subviewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(subview)

    viewLayoutDimensionAnchorAttributes.forEach { viewAnchor in
      subviewLayoutDimensionAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withSecondViewAnchor_withMultiplier_withoutConstant() {
    let viewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(view)
    let subviewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(subview)

    viewLayoutDimensionAnchorAttributes.forEach { viewAnchor in
      subviewLayoutDimensionAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withSecondViewAnchor_withoutMultiplier_withConstant() {
    let viewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(view)
    let subviewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(subview)

    viewLayoutDimensionAnchorAttributes.forEach { viewAnchor in
      subviewLayoutDimensionAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor,
              subviewAnchor: subviewAnchor)
          }
        }
      }
    }
  }

  func testLayoutDimensionAnchors_withoutSecondViewAnchor_withoutMultiplier_withConstant() {
    let viewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(view)
    let subviewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(subview)

    viewLayoutDimensionAnchorAttributes.forEach { viewAnchor in
      subviewLayoutDimensionAnchorAttributes.forEach { subviewAnchor in
        layoutStyles.forEach { layoutStyle in
          switch layoutStyle {
          case .imperative:
            testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor)
          case .declarative:
            testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
              viewAnchor: viewAnchor)
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
    viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutYAxisAnchorRelationsAndPriorities(
    viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutYAxisAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutXAxisAnchorRelationsAndPriorities(
    viewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutXAxisAnchorRelationsAndPriorities(
    viewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutXAxisAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= constant
              } else {
                constraint = viewAnchor.anchor !<= constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= constant
              } else {
                constraint = viewAnchor.anchor !>= constant
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == constant
              } else {
                constraint = viewAnchor.anchor != constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(constant)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(constant)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(constant)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor + constant
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor + constant
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndConstants(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              constant: constant,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = round(CGFloat.random(in: -1000...1000))

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor * multiplier
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor * multiplier
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor * multiplier
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor * multiplier
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor * multiplier
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor * multiplier
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testDeclarativeLayoutDimensionAnchorRelationsPrioritiesAndMultipliers(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = round(CGFloat.random(in: -1000...1000))

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
              relation: relation,
              multiplier: multiplier,
              priority: priority,
              isActive: isActive)
          }
        }
      }
    }

  func testImperativeLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = round(CGFloat.random(in: -1000...1000))
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor <= subviewAnchor.anchor * multiplier + constant
              } else {
                constraint = viewAnchor.anchor !<= subviewAnchor.anchor * multiplier + constant
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor >= subviewAnchor.anchor * multiplier + constant
              } else {
                constraint = viewAnchor.anchor !>= subviewAnchor.anchor * multiplier + constant
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor == subviewAnchor.anchor * multiplier + constant
              } else {
                constraint = viewAnchor.anchor != subviewAnchor.anchor * multiplier + constant
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
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
    viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
    subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

      initialSetup()

      relations.forEach { relation in
        priorities.forEach { priority in
          isActives.forEach { isActive in

            var constraint: NSLayoutConstraint
            let multiplier = round(CGFloat.random(in: -1000...1000))
            let constant = CGFloat.random(in: -1000...1000)

            switch relation {
            case .lessThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .lessThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            case .greaterThanOrEqual:
              if isActive {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .greaterThanOrEqualTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            default:
              if isActive {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
              } else {
                constraint = viewAnchor.anchor
                  .equalTo(subviewAnchor.anchor)
                  .multiplier(multiplier)
                  .constant(constant)
                  .deactivate()
              }
            }
            constraint.priority = priority
            testConstraint(
              constraint,
              firstAttribute: viewAnchor.attribute,
              secondAttribute: subviewAnchor.attribute,
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

      XCTAssertEqual(constraint.firstItem as? NSObject, view)
      XCTAssertEqual(constraint.firstAttribute, firstAttribute)
      if let secondAttribute {
        XCTAssertEqual(constraint.secondItem as? NSObject, subview)
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

      XCTAssertEqual(constraint.firstItem as? NSObject, view)
      XCTAssertEqual(constraint.firstAttribute, firstAttribute)
      if let secondAttribute {
        XCTAssertEqual(constraint.secondItem as? NSObject, subview)
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

