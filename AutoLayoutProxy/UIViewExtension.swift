//
//  UIViewExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

public extension UIView {

    func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        layoutView(view, using: layout)
    }

    func layoutView(_ view: UIView, using closure: (LayoutProxy) -> Void) {
        view.translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: view, superView: self))
    }
}

public extension UIView {

    func addSubview(
        _ view: UIView,
        anchors: Set<NSLayoutConstraint.Attribute>      = [],
        top: NSLayoutYAxisAnchor?                       = nil,
        topRelation: NSLayoutConstraint.Relation        = .equal,
        left: NSLayoutXAxisAnchor?                      = nil,
        leftRelation: NSLayoutConstraint.Relation       = .equal,
        bottom: NSLayoutYAxisAnchor?                    = nil,
        bottomRelation: NSLayoutConstraint.Relation     = .equal,
        right: NSLayoutXAxisAnchor?                     = nil,
        rightRelation: NSLayoutConstraint.Relation      = .equal,
        padding: UIEdgeInsets                           = .zero,
        centerX: NSLayoutXAxisAnchor?                   = nil,
        centerXRelation: NSLayoutConstraint.Relation    = .equal,
        centerY: NSLayoutYAxisAnchor?                   = nil,
        centerYRelation: NSLayoutConstraint.Relation    = .equal,
        offset: UIOffset                                = .zero,
        width: NSLayoutDimension?                       = nil,
        widthRelation: NSLayoutConstraint.Relation      = .equal,
        height: NSLayoutDimension?                      = nil,
        heightRelation: NSLayoutConstraint.Relation     = .equal,
        multiplier: CGMultiplier                        = .one,
        size: CGSize                                    = .zero) {

        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        anchorEdges(view,
                    sides: anchors,
                    top: top,
                    topRelation: topRelation,
                    left: left,
                    leftRelation: leftRelation,
                    bottom: bottom,
                    bottomRelation: bottomRelation,
                    right: right,
                    rightRelation: rightRelation,
                    padding: padding)
        anchorCenters(view,
                      centers: anchors,
                      centerX: centerX,
                      centerXRelation: centerXRelation,
                      centerY: centerY,
                      centerYRelation: centerYRelation,
                      offset: offset)
        anchorSides(view,
                   sides: anchors,
                   width: width,
                   widthRelation: widthRelation,
                   height: height,
                   heightRelation: heightRelation,
                   multiplier: multiplier,
                   size: size)
    }

    func anchorEdges(
        _ view: UIView,
        sides: Set<NSLayoutConstraint.Attribute>        = [],
        top: NSLayoutYAxisAnchor?                       = nil,
        topRelation: NSLayoutConstraint.Relation        = .equal,
        left: NSLayoutXAxisAnchor?                      = nil,
        leftRelation: NSLayoutConstraint.Relation       = .equal,
        bottom: NSLayoutYAxisAnchor?                    = nil,
        bottomRelation: NSLayoutConstraint.Relation     = .equal,
        right: NSLayoutXAxisAnchor?                     = nil,
        rightRelation: NSLayoutConstraint.Relation      = .equal,
        padding: UIEdgeInsets                           = .zero) {

        view.translatesAutoresizingMaskIntoConstraints = false

        if sides.contains(.top) || top != nil {
            anchor(
                lhs: view.topAnchor,
                relation: topRelation,
                rhs: top ?? topAnchor,
                padding: padding.top)
        }
        if sides.contains(.leading) || sides.contains(.left) || left != nil {
            anchor(
                lhs: view.leadingAnchor,
                relation: leftRelation,
                rhs: left ?? leadingAnchor,
                padding: padding.left)
        }
        if sides.contains(.bottom) || bottom != nil {
            anchor(
                lhs: view.bottomAnchor,
                relation: bottomRelation,
                rhs: bottom ?? bottomAnchor,
                padding: padding.bottom)
        }
        if sides.contains(.trailing) || sides.contains(.right) || right != nil {
            anchor(
                lhs: view.trailingAnchor,
                relation: rightRelation,
                rhs: right ?? trailingAnchor,
                padding: padding.right)
        }
    }

    func anchorCenters(
        _ view: UIView,
        centers: Set<NSLayoutConstraint.Attribute>      = [],
        centerX: NSLayoutXAxisAnchor?                   = nil,
        centerXRelation: NSLayoutConstraint.Relation    = .equal,
        centerY: NSLayoutYAxisAnchor?                   = nil,
        centerYRelation: NSLayoutConstraint.Relation    = .equal,
        offset: UIOffset                                = .zero) {

        view.translatesAutoresizingMaskIntoConstraints = false

        if centers.contains(.centerX) || centerX != nil {
            anchor(
                lhs: view.centerXAnchor,
                relation: centerXRelation,
                rhs: centerX ?? centerXAnchor,
                padding: offset.horizontal)
        }
        if centers.contains(.centerY) || centerY != nil {
            anchor(
                lhs: view.centerYAnchor,
                relation: centerYRelation,
                rhs: centerY ?? centerYAnchor,
                padding: offset.vertical)
        }
    }

    func anchorSides(
        _ view: UIView,
        sides: Set<NSLayoutConstraint.Attribute>        = [],
        width: NSLayoutDimension?                       = nil,
        widthRelation: NSLayoutConstraint.Relation      = .equal,
        height: NSLayoutDimension?                      = nil,
        heightRelation: NSLayoutConstraint.Relation     = .equal,
        multiplier: CGMultiplier                        = .one,
        size: CGSize                                    = .zero) {

        view.translatesAutoresizingMaskIntoConstraints = false

        if sides.contains(.width) || width != nil {
            anchor(
                lhs: view.widthAnchor,
                relation: widthRelation,
                rhs: width ?? widthAnchor,
                multiplier: multiplier.width,
                constant: size.width)
        } else if size.width != 0 {
            anchor(
                lhs: view.widthAnchor,
                relation: widthRelation,
                constant: size.width)
        }
        if sides.contains(.height) || height != nil {
            anchor(
                lhs: view.heightAnchor,
                relation: heightRelation,
                rhs: height ?? heightAnchor,
                multiplier: multiplier.height,
                constant: size.height)
        } else if size.height != 0 {
            anchor(
                lhs: view.heightAnchor,
                relation: heightRelation,
                constant: size.height)
        }
    }

    func anchor<Axis>(
        lhs: NSLayoutAnchor<Axis>,
        relation: NSLayoutConstraint.Relation   = .equal,
        rhs: NSLayoutAnchor<Axis>,
        padding: CGFloat                        = 0) {

        switch relation {
        case .lessThanOrEqual:
            lhs.constraint(lessThanOrEqualTo: rhs, constant: padding).isActive = true
        case .greaterThanOrEqual:
            lhs.constraint(greaterThanOrEqualTo: rhs, constant: padding).isActive = true
        default:
            lhs.constraint(equalTo: rhs, constant: padding).isActive = true
        }
    }

    func anchor(
        lhs: NSLayoutDimension,
        relation: NSLayoutConstraint.Relation   = .equal,
        rhs: NSLayoutDimension?                 = nil,
        multiplier: CGFloat                     = 1,
        constant: CGFloat                       = 0) {

        switch relation {
        case .lessThanOrEqual:
            if let rhs = rhs {
                lhs.constraint(lessThanOrEqualTo: rhs, multiplier: multiplier, constant: constant).isActive = true
            } else {
                lhs.constraint(lessThanOrEqualToConstant: constant).isActive = true
            }
        case .greaterThanOrEqual:
            if let rhs = rhs {
                lhs.constraint(greaterThanOrEqualTo: rhs, multiplier: multiplier, constant: constant).isActive = true
            } else {
                lhs.constraint(greaterThanOrEqualToConstant: constant).isActive = true
            }
        default:
            if let rhs = rhs {
                lhs.constraint(equalTo: rhs, multiplier: multiplier, constant: constant).isActive = true
            } else {
                lhs.constraint(equalToConstant: constant).isActive = true
            }
        }
    }
}
