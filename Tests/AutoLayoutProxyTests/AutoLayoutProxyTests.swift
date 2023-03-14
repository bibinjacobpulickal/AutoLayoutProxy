import XCTest
@testable import AutoLayoutProxy

final class AutoLayoutProxyTests: XCTestCase {

    static var allLayoutKitTests = [
        ("testAddSubview", testAddSubview),
        ("testAddArrangedSubview", testAddArrangedSubview),
        ("testTamic", testTamic),
        ("testLayoutYAxisAnchors", testLayoutYAxisAnchors),
        ("testLayoutXAxisAnchors1", testLayoutXAxisAnchors1),
        ("testLayoutXAxisAnchors2", testLayoutXAxisAnchors2),
        ("testLayoutDimensionAnchors", testLayoutDimensionAnchors)
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

    func testAddSubview() {

        initialSetup()

        XCTAssertTrue(view.subviews.contains(subview))
        XCTAssertTrue(subview.superview == view)
    }

    func testAddArrangedSubview() {

        stackView.addArrangedSubview(subview) { }

        XCTAssertTrue(stackView.arrangedSubviews.contains(subview))
        XCTAssertTrue(subview.superview == stackView)
        XCTAssertFalse(subview.tamic)
    }

    func testTamic() {
        initialSetup()
        XCTAssertFalse(subview.tamic)
    }

    func testLayoutYAxisAnchors() {
        let viewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(view)
        let subviewLayoutYAxisAnchorAttributes = getLayoutYAxisAnchorAttributesForView(subview)

        viewLayoutYAxisAnchorAttributes.forEach { viewAnchor in
            subviewLayoutYAxisAnchorAttributes.forEach { subviewAnchor in
                testLayoutYAxisAnchorRelationsAndPriorities(
                    viewAnchor: viewAnchor,
                    subviewAnchor: subviewAnchor)
                testLayoutYAxisAnchorRelationsPrioritiesAndConstants(
                    viewAnchor: viewAnchor,
                    subviewAnchor: subviewAnchor)
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

    func testLayoutXAxisAnchors1() {
        let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(view)
        let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView1(subview)

        viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
            subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
                testLayoutXAxisAnchorRelationsPrioritiesAndConstants(
                    viewAnchor: viewAnchor,
                    subviewAnchor: subviewAnchor)
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

    func testLayoutXAxisAnchors2() {
        let viewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(view)
        let subviewLayoutXAxisAnchorAttributes = getLayoutXAxisAnchorAttributesForView2(subview)

        viewLayoutXAxisAnchorAttributes.forEach { viewAnchor in
            subviewLayoutXAxisAnchorAttributes.forEach { subviewAnchor in
                testLayoutXAxisAnchorRelationsPrioritiesAndConstants(
                    viewAnchor: viewAnchor,
                    subviewAnchor: subviewAnchor)
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

    func testLayoutDimensionAnchors() {
        let viewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(view)
        let subviewLayoutDimensionAnchorAttributes = getLayoutDimensionAnchorAttributesForView(subview)

        viewLayoutDimensionAnchorAttributes.forEach { viewAnchor in
            subviewLayoutDimensionAnchorAttributes.forEach { subviewAnchor in
                testLayoutDimensionAnchorRelationsPrioritiesAndConstants(
                    viewAnchor: viewAnchor,
                    subviewAnchor: subviewAnchor)
            }
        }
    }

    func getLayoutDimensionAnchorAttributesForView(_ view: BBAnchorable) -> [(anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)] {
        [
            (view.width, .width),
            (view.height, .height)
        ]
    }

    func testLayoutYAxisAnchorRelationsAndPriorities(
        viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
        subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

        let relations = [NSLayoutConstraint.Relation.equal,
                         .greaterThanOrEqual,
                         .lessThanOrEqual]
        let isActives = [true, false]

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

    func testLayoutYAxisAnchorRelationsPrioritiesAndConstants(
        viewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute),
        subviewAnchor: (anchor: NSLayoutYAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

        let relations = [NSLayoutConstraint.Relation.equal,
                         .greaterThanOrEqual,
                         .lessThanOrEqual]
        let isActives = [true, false]

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

    func testLayoutXAxisAnchorRelationsPrioritiesAndConstants(
        viewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute),
        subviewAnchor: (anchor: NSLayoutXAxisAnchor, attribute: NSLayoutConstraint.Attribute)) {

        let relations = [NSLayoutConstraint.Relation.equal,
                         .greaterThanOrEqual,
                         .lessThanOrEqual]
        let isActives = [true, false]

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

    func testLayoutDimensionAnchorRelationsPrioritiesAndConstants(
        viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
        subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

        let relations = [NSLayoutConstraint.Relation.equal,
                         .greaterThanOrEqual,
                         .lessThanOrEqual]
        let isActives = [true, false]

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

    func testLayoutDimensionAnchorRelationsPrioritiesMultipliersAndConstants(
        viewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute),
        subviewAnchor: (anchor: NSLayoutDimension, attribute: NSLayoutConstraint.Attribute)) {

        let relations = [NSLayoutConstraint.Relation.equal,
                         .greaterThanOrEqual,
                         .lessThanOrEqual]
        let isActives = [true, false]

        initialSetup()

        relations.forEach { relation in
            priorities.forEach { priority in
                isActives.forEach { isActive in

                    var constraint: NSLayoutConstraint
                    let multiplier = CGFloat.random(in: -1000...1000)
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
        secondAttribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat                     = 0,
        multiplier: CGFloat                   = 1,
        priority: UILayoutPriority            = .required,
        isActive: Bool                        = true) {

        XCTAssertTrue(constraint.firstItem as? NSObject == view)
        XCTAssertTrue(constraint.secondItem as? NSObject == subview)
        XCTAssertTrue(constraint.firstAttribute == firstAttribute)
        XCTAssertTrue(constraint.secondAttribute == secondAttribute)
        XCTAssertTrue(constraint.relation == relation)
        XCTAssertTrue(constraint.constant == constant)
        XCTAssertTrue(constraint.multiplier == multiplier)
        XCTAssertTrue(constraint.priority == priority)
        XCTAssertTrue(constraint.isActive == isActive)
    }

    #elseif canImport(AppKit)

    func testConstraint(
        _ constraint: NSLayoutConstraint,
        firstAttribute: NSLayoutConstraint.Attribute,
        secondAttribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat                     = 0,
        multiplier: CGFloat                   = 1,
        priority: NSLayoutConstraint.Priority = .required,
        isActive: Bool                        = true) {

        XCTAssertTrue(constraint.firstItem as? NSObject == view)
        XCTAssertTrue(constraint.secondItem as? NSObject == subview)
        XCTAssertTrue(constraint.firstAttribute == firstAttribute)
        XCTAssertTrue(constraint.secondAttribute == secondAttribute)
        XCTAssertTrue(constraint.relation == relation)
        XCTAssertTrue(constraint.constant == constant)
        XCTAssertTrue(constraint.multiplier == multiplier)
        XCTAssertTrue(constraint.priority == priority)
        XCTAssertTrue(constraint.isActive == isActive)
    }

    #endif

    private func initialSetup() {
        view.addSubview(subview) { }
    }
}

