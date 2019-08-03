//
//  AutoLayoutableExtensions.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

public extension AutoLayoutable {

    func addSubview(
        _ view: Self,
        anchors: Set<NSLayoutConstraint.Attribute>      = [],
        top: NSLayoutYAxisAnchor?                       = nil,
        topRelation: NSLayoutConstraint.Relation        = .equal,
        left: NSLayoutXAxisAnchor?                      = nil,
        leftRelation: NSLayoutConstraint.Relation       = .equal,
        bottom: NSLayoutYAxisAnchor?                    = nil,
        bottomRelation: NSLayoutConstraint.Relation     = .equal,
        right: NSLayoutXAxisAnchor?                     = nil,
        rightRelation: NSLayoutConstraint.Relation      = .equal,
        inset: EdgeInsetConvertible                     = 0,
        centerX: NSLayoutXAxisAnchor?                   = nil,
        centerXRelation: NSLayoutConstraint.Relation    = .equal,
        centerY: NSLayoutYAxisAnchor?                   = nil,
        centerYRelation: NSLayoutConstraint.Relation    = .equal,
        offset: OffsetConvertible                       = 0,
        width: NSLayoutDimension?                       = nil,
        widthRelation: NSLayoutConstraint.Relation      = .equal,
        height: NSLayoutDimension?                      = nil,
        heightRelation: NSLayoutConstraint.Relation     = .equal,
        multiplier: MultiplierConvertible               = 1,
        size: SizeConvertible                           = 0) {

        addSubview(view)

        anchorView(
            view,
            anchors: anchors,
            top: top,
            topRelation: topRelation,
            left: left,
            leftRelation: leftRelation,
            bottom: bottom,
            bottomRelation: bottomRelation,
            right: right,
            rightRelation: rightRelation,
            inset: inset,
            centerX: centerX,
            centerXRelation: centerXRelation,
            centerY: centerY,
            centerYRelation: centerYRelation,
            offset: offset,
            width: width,
            widthRelation: widthRelation,
            height: height,
            heightRelation: heightRelation,
            multiplier: multiplier,
            size: size)
    }

    func anchorView(
        _ view: Self,
        anchors: Set<NSLayoutConstraint.Attribute>      = [],
        top: NSLayoutYAxisAnchor?                       = nil,
        topRelation: NSLayoutConstraint.Relation        = .equal,
        left: NSLayoutXAxisAnchor?                      = nil,
        leftRelation: NSLayoutConstraint.Relation       = .equal,
        bottom: NSLayoutYAxisAnchor?                    = nil,
        bottomRelation: NSLayoutConstraint.Relation     = .equal,
        right: NSLayoutXAxisAnchor?                     = nil,
        rightRelation: NSLayoutConstraint.Relation      = .equal,
        inset: EdgeInsetConvertible                     = 0,
        centerX: NSLayoutXAxisAnchor?                   = nil,
        centerXRelation: NSLayoutConstraint.Relation    = .equal,
        centerY: NSLayoutYAxisAnchor?                   = nil,
        centerYRelation: NSLayoutConstraint.Relation    = .equal,
        offset: OffsetConvertible                       = 0,
        width: NSLayoutDimension?                       = nil,
        widthRelation: NSLayoutConstraint.Relation      = .equal,
        height: NSLayoutDimension?                      = nil,
        heightRelation: NSLayoutConstraint.Relation     = .equal,
        multiplier: MultiplierConvertible               = 1,
        size: SizeConvertible                           = 0) {

        anchorEdges(
            view,
            sides: anchors,
            top: top,
            topRelation: topRelation,
            left: left,
            leftRelation: leftRelation,
            bottom: bottom,
            bottomRelation: bottomRelation,
            right: right,
            rightRelation: rightRelation,
            inset: inset)
        anchorCenters(
            view,
            centers: anchors,
            centerX: centerX,
            centerXRelation: centerXRelation,
            centerY: centerY,
            centerYRelation: centerYRelation,
            offset: offset)
        anchorSides(
            view,
            sides: anchors,
            width: width,
            widthRelation: widthRelation,
            height: height,
            heightRelation: heightRelation,
            multiplier: multiplier,
            size: size)
    }

    func anchorEdges(
        _ view: Self,
        sides: Set<NSLayoutConstraint.Attribute>        = [],
        top: NSLayoutYAxisAnchor?                       = nil,
        topRelation: NSLayoutConstraint.Relation        = .equal,
        left: NSLayoutXAxisAnchor?                      = nil,
        leftRelation: NSLayoutConstraint.Relation       = .equal,
        bottom: NSLayoutYAxisAnchor?                    = nil,
        bottomRelation: NSLayoutConstraint.Relation     = .equal,
        right: NSLayoutXAxisAnchor?                     = nil,
        rightRelation: NSLayoutConstraint.Relation      = .equal,
        inset: EdgeInsetConvertible                     = 0) {

        view.translatesAutoresizingMaskIntoConstraints  = false

        if sides.contains(.top) || top != nil {
            view.anchor(
                lhs: .top,
                relation: topRelation,
                rhs: top ?? topAnchor,
                constant: inset.top)
        }
        if sides.contains(.leading) || sides.contains(.left) || left != nil {
            view.anchor(
                lhs: .left,
                relation: leftRelation,
                rhs: left ?? leadingAnchor,
                constant: inset.left)
        }
        if sides.contains(.bottom) || bottom != nil {
            view.anchor(
                lhs: .bottom,
                relation: bottomRelation,
                rhs: bottom ?? bottomAnchor,
                constant: inset.bottom)
        }
        if sides.contains(.trailing) || sides.contains(.right) || right != nil {
            view.anchor(
                lhs: .right,
                relation: rightRelation,
                rhs: right ?? trailingAnchor,
                constant: inset.right)
        }
    }

    func anchorCenters(
        _ view: Self,
        centers: Set<NSLayoutConstraint.Attribute>      = [],
        centerX: NSLayoutXAxisAnchor?                   = nil,
        centerXRelation: NSLayoutConstraint.Relation    = .equal,
        centerY: NSLayoutYAxisAnchor?                   = nil,
        centerYRelation: NSLayoutConstraint.Relation    = .equal,
        offset: OffsetConvertible                       = 0) {

        view.translatesAutoresizingMaskIntoConstraints  = false

        if centers.contains(.centerX) || centerX != nil {
            view.anchor(
                lhs: .centerX,
                relation: centerXRelation,
                rhs: centerX ?? centerXAnchor,
                constant: offset.horizontal)
        }
        if centers.contains(.centerY) || centerY != nil {
            view.anchor(
                lhs: .centerY,
                relation: centerYRelation,
                rhs: centerY ?? centerYAnchor,
                constant: offset.vertical)
        }
    }

    func anchorSides(
        _ view: Self,
        sides: Set<NSLayoutConstraint.Attribute>        = [],
        width: NSLayoutDimension?                       = nil,
        widthRelation: NSLayoutConstraint.Relation      = .equal,
        height: NSLayoutDimension?                      = nil,
        heightRelation: NSLayoutConstraint.Relation     = .equal,
        multiplier: MultiplierConvertible               = 1,
        size: SizeConvertible                           = 0) {

        view.translatesAutoresizingMaskIntoConstraints  = false

        if sides.contains(.width) || width != nil {
            view.anchor(
                lhs: .width,
                relation: widthRelation,
                rhs: width ?? widthAnchor,
                multiplier: multiplier.multiplierValue.width,
                constant: size.sizeValue.width)
        } else if size.sizeValue.width != 0 {
            view.anchor(
                lhs: .width,
                relation: widthRelation,
                rhs: size.sizeValue.width)
        }
        if sides.contains(.height) || height != nil {
            view.anchor(
                lhs: .height,
                relation: heightRelation,
                rhs: height ?? heightAnchor,
                multiplier: multiplier.multiplierValue.height,
                constant: size.sizeValue.height)
        } else if size.sizeValue.height != 0 {
            view.anchor(
                lhs: .height,
                relation: heightRelation,
                rhs: size.sizeValue.height)
        }
    }

    func anchor<Axis>(
        lhs: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation   = .equal,
        rhs: NSLayoutAnchor<Axis>?              = nil,
        multiplier: CGFloat                     = 1,
        constant: CGFloat                       = 0) {

        let lhs = anchor(for: lhs) as NSLayoutAnchor<Axis>?

        switch relation {
        case .lessThanOrEqual:
            if let lhs = lhs as? NSLayoutDimension {
                if let rhs = rhs as? NSLayoutDimension {
                    lhs.constraint(
                        lessThanOrEqualTo: rhs,
                        multiplier: multiplier,
                        constant: constant)
                        .isActive = true
                } else if constant != 0 {
                    lhs.constraint(
                        lessThanOrEqualToConstant: constant)
                        .isActive = true
                }
            } else if let rhs = rhs {
                lhs?.constraint(
                    lessThanOrEqualTo: rhs,
                    constant: constant)
                    .isActive = true
            }
        case .greaterThanOrEqual:
            if let lhs = lhs as? NSLayoutDimension {
                if let rhs = rhs as? NSLayoutDimension {
                    lhs.constraint(
                        greaterThanOrEqualTo: rhs,
                        multiplier: multiplier,
                        constant: constant)
                        .isActive = true
                } else if constant != 0 {
                    lhs.constraint(
                        greaterThanOrEqualToConstant: constant)
                        .isActive = true
                }
            } else if let rhs = rhs {
                lhs?.constraint(
                    greaterThanOrEqualTo: rhs,
                    constant: constant)
                    .isActive = true
            }
        default:
            if let lhs = lhs as? NSLayoutDimension {
                if let rhs = rhs as? NSLayoutDimension {
                    lhs.constraint(
                        equalTo: rhs,
                        multiplier: multiplier,
                        constant: constant)
                        .isActive = true
                } else if constant != 0 {
                    lhs.constraint(
                        equalToConstant: constant)
                        .isActive = true
                }
            } else if let rhs = rhs {
                lhs?.constraint(
                    equalTo: rhs,
                    constant: constant)
                    .isActive = true
            }
        }
    }

    func anchor(
        lhs: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation   = .equal,
        rhs: CGFloat                            = 0) {

        let lhs = anchor(for: lhs) as NSLayoutAnchor<NSLayoutDimension>?

        switch relation {
        case .lessThanOrEqual:
            if let lhs = lhs as? NSLayoutDimension {
                lhs.constraint(
                    lessThanOrEqualToConstant: rhs)
                    .isActive = true
            }
        case .greaterThanOrEqual:
            if let lhs = lhs as? NSLayoutDimension {
                lhs.constraint(
                    greaterThanOrEqualToConstant: rhs)
                    .isActive = true
            }
        default:
            if let lhs = lhs as? NSLayoutDimension {
                lhs.constraint(
                    equalToConstant: rhs)
                    .isActive = true
            }
        }
    }

    private func anchor<AnchorType>(for attribute: NSLayoutConstraint.Attribute) -> NSLayoutAnchor<AnchorType>? {
        switch attribute {
        case .left, .leading:
            return leadingAnchor as? NSLayoutAnchor<AnchorType>
        case .right, .trailing:
            return trailingAnchor as? NSLayoutAnchor<AnchorType>
        case .top:
            return topAnchor as? NSLayoutAnchor<AnchorType>
        case .bottom:
            return bottomAnchor as? NSLayoutAnchor<AnchorType>
        case .width:
            return widthAnchor as? NSLayoutAnchor<AnchorType>
        case .height:
            return heightAnchor as? NSLayoutAnchor<AnchorType>
        case .centerX:
            return centerXAnchor as? NSLayoutAnchor<AnchorType>
        case .centerY:
            return centerYAnchor as? NSLayoutAnchor<AnchorType>
        default:
            return nil
        }
    }
}
